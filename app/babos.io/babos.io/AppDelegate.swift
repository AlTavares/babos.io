//
//  AppDelegate.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        NetworkReachability.sharedInstance.startListening()
        return true
    }

}

