//
//  AppCordinator.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import UIKit

final class AppCoordinator {
	private let window: UIWindow?
	private let dependencies: AppDependecies
	
	private let rootNavigationController: UINavigationController = {
		let navigationViewController = UINavigationController()
		navigationViewController.navigationBar.isHidden = true
		navigationViewController.modalPresentationStyle = .fullScreen
		
		return navigationViewController
	}()
	
	private var childCoordinators = [Coordinatable]()
	private let isLogged: Bool = true
	
	init(window: UIWindow?, dependencies: AppDependecies) {
		self.window = window
		self.dependencies = dependencies
	}
	
	func start() {
		window?.rootViewController = rootNavigationController
		window?.makeKeyAndVisible()
		
		if isLogged {
			let feedCoordinator = FeedCoordinator(rootNavigationController, dependencies)
			feedCoordinator.start()
			childCoordinators.append(feedCoordinator)
		}
	}
	
}
