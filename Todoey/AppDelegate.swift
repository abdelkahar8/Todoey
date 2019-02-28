//
//  AppDelegate.swift
//  Todoey
//
//  Created by abdelkahar mostafa on 2/24/19.
//  Copyright © 2019 abdelkahar mostafa. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("error with realm\(error)")
        }
        
        return true
    }

   

}

