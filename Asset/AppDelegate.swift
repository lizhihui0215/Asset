//
//  AppDelegate.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    var launchStoryboardScenes: [String: StoryboardType.Type] = [StoryboardScene.Login.storyboardName: StoryboardScene.Login.self.self,
                                                                 StoryboardScene.Tab.storyboardName: StoryboardScene.Tab.self]

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if DEBUG
            NetworkActivityLogger.shared.startLogging()
        #endif
        #if MOCK
            Mocker.shared.registerMockers()
        #endif
        BDLocationService.shared.launchService()
        DropDown.startListeningToKeyboard()

        if #available(iOS 13.0, *) { return true }
        let storyboardName = launchEntranceName()
        let type = launchStoryboardScenes[storyboardName]!
        window?.rootViewController = InitialSceneType(storyboard: type.self).instantiate()
        return true
    }

    func launchEntranceName() -> String {
        guard #available(iOS 13.0, *) else {
            return app.credential != nil ? "Tab" : "Login"
        }

        return app.credential != nil ? "Tab Configuration" : "Default Configuration"
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        UISceneConfiguration(name: launchEntranceName(), sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
