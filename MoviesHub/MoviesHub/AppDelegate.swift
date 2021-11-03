//
//  AppDelegate.swift
//  MoviesHub
//
//  Created by Ahmed Besbes on 25/10/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController  = UINavigationController()
        let initialViewController = MovieListViewController()
        navigationController.viewControllers = [initialViewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

}
