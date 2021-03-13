//
//  AppDelegate.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var appCoordinator: AppCoordinator?
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		
		let dependencies = AppAssembly.assembly()
		appCoordinator = AppCoordinator(window: window, dependencies: dependencies)
		appCoordinator?.start()
		
		return true
	}

}

