//
//  AppDelegate.swift
//  LoginApp (SwiftBookDZ)
//
//  Created by Vlad Sytnik on 03.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        let userDefault = UserDefaults.standard
        let test = userDefault.dictionary(forKey: "persons") as? [String: [String]]
        
//        print("При запуске приложения в памяти: \(test ?? ["usernameNil": ["passwordNil", "nameNil"]])")
        print("При запуске приложения в памяти:")
        test?.forEach({
            print("\($0)")
        })
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//        let defaults = UserDefaults.standard
//        defaults.set(Users.users, forKey: DefaultsKeys.keyOne)
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {

    }


}

