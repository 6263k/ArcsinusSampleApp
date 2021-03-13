//
//  FeedCoordinator.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import UIKit

final class FeedCoordinator {
	private let dependencies: AppDependecies
	private let parentNavigationController: UINavigationController
	
	private let navigationController: UINavigationController = {
		let navigationViewController = UINavigationController()
		navigationViewController.navigationBar.isHidden = true
		navigationViewController.modalPresentationStyle = .fullScreen
		navigationViewController.modalTransitionStyle = .crossDissolve
		return navigationViewController
	}()
	
	init(_ navigationController: UINavigationController, _ dependencies: AppDependecies) {
		self.dependencies = dependencies
		self.parentNavigationController = navigationController
	}
	
	func start() {
		let feedViewController = FeedViewController.instatiate(with: .main)
		navigationController.setViewControllers([feedViewController], animated: false)
		parentNavigationController.show(navigationController, sender: nil)
	}
}
