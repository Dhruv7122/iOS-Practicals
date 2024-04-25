//
//  AppDelegate.swift
//  DhruvApp
//
//  Created by STTL on 11/04/24.
//

import UIKit
import SideMenu

var window: UIWindow?
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpLeftMenu()
        
        // Check UserDefaults for a value
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        // Set initial view controller based on UserDefaults
        var initialViewController: UIViewController
        
        //Check User is Already Logged In or Not
        if isLoggedIn {
            let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
            // Redirect to Dashboard
            initialViewController = storyboard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        } else {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            // Redirect to Login
            initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        }
        
        // Wrap the initial view controller in a navigation controller
        let navigationController = UINavigationController(rootViewController: initialViewController)
        
        // Hide the navigation bar
        navigationController.navigationBar.isHidden = true
        
        // Set root view controller
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func setUpLeftMenu() {
        let storyboard = UIStoryboard(name:"SideMenu", bundle: nil)
        guard let aSideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuVC") as? SideMenuVC else {
                fatalError("Unable to instantiate ViewController from storyboard")
            }
        let sideMenuViewController = SideMenuNavigationController(rootViewController: aSideMenuViewController)
        sideMenuViewController.leftSide = true
        sideMenuViewController.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = sideMenuViewController
        SideMenuManager.default.rightMenuNavigationController = sideMenuViewController
        sideMenuViewController.pushStyle = .default
        sideMenuViewController.presentationStyle = .menuSlideIn
        sideMenuViewController.presentationStyle.backgroundColor = .black
        sideMenuViewController.settings.statusBarEndAlpha = 0
        sideMenuViewController.presentationStyle.presentingEndAlpha = 0.6
        let  SCREEN_WIDTH = UIScreen.main.bounds.size.width
        sideMenuViewController.menuWidth = SCREEN_WIDTH * 0.8
    }
    
}

