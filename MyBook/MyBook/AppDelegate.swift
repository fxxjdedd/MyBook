//
//  AppDelegate.swift
//  MyBook
//
//  Created by Apple on 16/5/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        
        let tabBarController = UITabBarController()
        
        let item1 = UITabBarItem(title: "书榜", image: UIImage(named: "book0")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: "book")?.imageWithRenderingMode(.AlwaysOriginal))
        let item2 = UITabBarItem(title: "发现", image: UIImage(named: "earth0")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: "earth.png")?.imageWithRenderingMode(.AlwaysOriginal))
        let item3 = UITabBarItem(title: "评书", image: UIImage(named: "pencil0")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: "pencil.png")?.imageWithRenderingMode(.AlwaysOriginal))
        let item4 = UITabBarItem(title: "圈子", image: UIImage(named: "student0")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: "student.png")?.imageWithRenderingMode(.AlwaysOriginal))
        let item5 = UITabBarItem(title: "更多", image: UIImage(named: "more0")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: "more.png")?.imageWithRenderingMode(.AlwaysOriginal))
        
        let bookViewController = UINavigationController(rootViewController: BookViewController())
        
        let earthViewController = UINavigationController(rootViewController: EarthViewController())
        
        let pencilViewController = UINavigationController(rootViewController: PencilViewController())
        
        let studentViewController = UINavigationController(rootViewController: StudentViewController())

        let moreViewController = UINavigationController(rootViewController: MoreViewController())

        bookViewController.tabBarItem = item1
        earthViewController.tabBarItem = item2
        pencilViewController.tabBarItem = item3
        studentViewController.tabBarItem = item4
        moreViewController.tabBarItem = item5
        
        tabBarController.viewControllers = [bookViewController,earthViewController,pencilViewController,studentViewController,moreViewController]

        tabBarController.tabBar.tintColor = MAIN_COLOR
        self.window?.rootViewController = tabBarController
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

