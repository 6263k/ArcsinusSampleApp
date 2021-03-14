//
//  FeedCoordinator.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import RxSwift

final class FeedCoordinator: Coordinator {
	enum Route {
		case feedDetails
		case filters
	}
	
	private let dependencies: AppDependecies
	private let parentNavigationController: UINavigationController
	
	let navigationController: UINavigationController = {
		let navigationViewController = UINavigationController()
		navigationViewController.modalPresentationStyle = .fullScreen
		navigationViewController.modalTransitionStyle = .crossDissolve
		return navigationViewController
	}()
	
	init(_ navigationController: UINavigationController, _ dependencies: AppDependecies) {
		self.dependencies = dependencies
		self.parentNavigationController = navigationController
	}
	
	func start() {
		let feedViewModel = FeedViewModel()
		feedViewModel.route.subscribe(onNext: { [weak self] route in
			switch route {
			case .showDetails:
				self?.route(to: .feedDetails, with: PushTransition())
			case .presentFilters:
				self?.route(to: .filters, with: ModalTransition())
			}
		}).disposed(by: feedViewModel.disposeBag)
		
		guard let feedViewController = FeedViewController.create(feedViewModel, with: Storyboard.main) else { return }
		navigationController.setViewControllers([feedViewController], animated: false)
		parentNavigationController.show(navigationController, sender: nil)
	}
	
	func route(to route: Route, with transition: Transition) {
		switch route {
		case .feedDetails:
			guard let feedDetailsViewController = FeedDetailsViewController.create(FeedDetailsViewModel(), with: Storyboard.main) else { return }
			transition.open(feedDetailsViewController, from: navigationController, completion: nil)
		case .filters:
			break;
		}
	}
}
