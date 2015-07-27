//
//  AppDelegate.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/6.
//  Copyright © 2015年 颜魏. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?
    var tabBarVC: UITabBarController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window?.frame = UIScreen.mainScreen().bounds
        self.window?.backgroundColor = UIColor.whiteColor()
        
        //初始化TabBar
        tabBarVC = UITabBarController()
        self.window?.rootViewController = tabBarVC
        createTabBarChildVireControllers()
        
        //设置融云AppKey
        RCIM.sharedRCIM().initWithAppKey("3argexb6r9w5e", deviceToken: "")
        RCIM.sharedRCIM().userInfoDataSource = self
        RCIM.sharedRCIM().connectWithToken("PsqMTwQ05JOOsiEYQnVE4QKPypS+h+b87BN8s4DhbXERnl8urHOwM8SDUREG+8M/ph7UHyaCvOmGa+0Vsws8Ow==", success: { (_) -> Void in
            }, error: { (RCConnectErrorCode) -> Void in
            }) { () -> Void in
                
        }
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    //创建tabBarController的子控制器
    func createTabBarChildVireControllers() {
        //实例化tabBar的viewControllers
        let first = FirstViewController()
        let message = MessageViewController()
        let farm = FarmViewController()
        let trends = TrendsViewController()
        let my = MyViewController()
        
        let viewVCs: [UIViewController] = [first, message, farm, trends, my]
        let titles: [String] = ["首页", "消息", "庄主", "动态", "我的"]
        let images: [String] = ["", "", "", "", ""]
        
        for i in 0 ..< viewVCs.count {
            setTabBarItemWithController(viewVCs[i], title: titles[i], image: images[i])
        }
    }
    
    //设置TabBarItem的部分属性
    func setTabBarItemWithController(viewcontroller :UIViewController, title: String, image: String)  {
        let nav = UINavigationController(rootViewController: viewcontroller)
        
        nav.title = title
        var textContext = [String: AnyObject]()
        textContext[NSForegroundColorAttributeName] = UIColor.purpleColor()
        nav.tabBarItem.setTitleTextAttributes(textContext, forState: UIControlState.Selected)
        
        nav.tabBarItem.image = UIImage(named: image)
        nav.tabBarItem.selectedImage = UIImage(named: image)
        
        tabBarVC?.addChildViewController(nav)
    }

    //实现融云好友的代理方法
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        if "yw1" == userId {
            let info = RCUserInfo()
            info.userId = "yw1"
            info.name = "yw1"
            info.portraitUri = ""
            completion(info)
        }else if "yw2" == userId {
            let info = RCUserInfo()
            info.userId = "yw2"
            info.name = "yw2"
            info.portraitUri = ""
            completion(info)
        }else if "yw3" == userId {
            let info = RCUserInfo()
            info.userId = "yw3"
            info.name = "yw3"
            info.portraitUri = ""
            completion(info)
        }else {
            completion(nil)
        }
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
    
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        
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

