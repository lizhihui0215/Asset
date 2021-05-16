//
//  Created by Tom Baranes on 03/04/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit

open class PresentExplodeSegue: UIStoryboardSegue {
    override open func perform() {
        let transitionType: TransitionAnimationType = .explode(xFactor: nil, minAngle: nil, maxAngle: nil)
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: transitionType)
        source.present(destination, animated: true, completion: nil)
    }
}
