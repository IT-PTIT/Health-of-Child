//
//  AppDelegate.swift
//  DeTai
//
//  Created by Nhung on 5/14/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import Firebase
import Realm
import RealmSwift
import GoogleSignIn
import GGLCore
import FirebaseDatabase
import FBSDKCoreKit
//import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var databaseRef: FIRDatabaseReference!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        //FirebaseApp.configure()
        
        
        // add realm 
        FIRApp.configure()
        var defaultRealmURL: URL? = RLMRealmConfiguration.default().fileURL
        var defaultRealmParentURL: URL? = defaultRealmURL?.deletingLastPathComponent()
        var v0URL: URL? = Bundle.main.url(forResource: "default", withExtension: "realm")
        try? FileManager.default.removeItem(at: defaultRealmURL!)
        try? FileManager.default.copyItem(at: v0URL!, to: defaultRealmURL!)
        // trying to open an outdated realm file without first registering a new schema version and migration block
        // with throw
        defer {
        }
        do {
            RLMRealm.default()
        } catch _ {
            print("Trying to open an outdated realm a migration block threw an exception.")
        }
        //login
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        if (GIDSignIn.sharedInstance().hasAuthInKeychain() == true) || (FBSDKAccessToken.current() != nil) || (FIRAuth.auth()?.currentUser != nil){
            print("Had have user!")
            //            let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            self.window?.rootViewController?.performSegue(withIdentifier: "RootView", sender: nil)
        }
        
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let FBhandled =  FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        let GGhandled = GIDSignIn.sharedInstance().handle(url,
                                                          sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                          annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return FBhandled || GGhandled

    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

