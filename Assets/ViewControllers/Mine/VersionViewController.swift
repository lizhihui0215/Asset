//
//  VersionViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/5/24.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class VersionViewController: BaseViewController {
    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var targetVersionLabel: UILabel!
    @IBOutlet var filenameLabel: UILabel!
    @IBOutlet var noteLabel: UILabel!
    @IBOutlet var updateButton: AnimatableButton!
    @UserDefault(key: SirenKeys.StoredVersionCheckDate, defaultValue: nil)
    var alertPresentationDate: Date?

    var viewModel: VersionViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchVersion().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.updateViews()
        }
    }

    func updateViews() {
        versionLabel.text = viewModel.version
        targetVersionLabel.text = viewModel.targetVersion
        filenameLabel.text = viewModel.filename
        noteLabel.text = viewModel.notes

        guard let updateType = viewModel.updateType,
              let rules = try? Siren.shared.rulesManager.loadRulesForUpdateType(updateType)
        else {
            updateButton.isHidden = true
            return
        }

        if rules.frequency == .immediately {
            updateButton.isHidden = false
        } else {
            guard let alertPresentationDate = alertPresentationDate else {
                updateButton.isHidden = false
                return
            }
            if Date.days(since: alertPresentationDate) >= rules.frequency.rawValue {
                updateButton.isHidden = false
            } else {
                updateButton.isHidden = true
            }
        }
    }

    @IBAction func updateTapped(_ sender: AnimatableButton) {}

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
