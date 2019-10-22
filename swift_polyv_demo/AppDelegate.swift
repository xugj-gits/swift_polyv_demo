//
//  AppDelegate.swift
//  swift_polyv_demo
//
//  Created by reanod on 2019/10/22.
//  Copyright © 2019 高效码农. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let screen = UIScreen.main.bounds        //获得设备尺寸
        self.window = UIWindow.init(frame: screen) //给“输出窗口“实例化并设置frame
        let viewController = ViewController() //实例化一个ViewController
        let navigationController = UINavigationController(rootViewController: viewController)  //为ViewController设置一个导航栏
        self.window?.rootViewController = navigationController//将“输出窗口”的根视图设置为导航栏
        self.window?.makeKeyAndVisible()  
        return true
    }


}

