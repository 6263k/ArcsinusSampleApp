//
//  SetTransition.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 14.03.2021.
//

import Foundation

import UIKit

final class SetTransition: NSObject {
	var isAnimated: Bool = true
	
	private weak var from: UIViewController?
	private var openCompletionHandler: (() -> Void)?
	private var closeCompletionHandler: (() -> Void)?
	
	private var navigationController: UINavigationController? {
		guard let navigation = from as? UINavigationController else { return from?.navigationController }
		return navigation
	}
	
	init(isAnimated: Bool = true) {
		self.isAnimated = isAnimated
	}
}

extension SetTransition: Transition {
	
	func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)? = nil) {
		self.from = from
		openCompletionHandler = completion
		navigationController?.delegate = self
		navigationController?.setViewControllers([viewController], animated: isAnimated)
	}
	
	func close(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
		closeCompletionHandler = completion
		navigationController?.popViewController(animated: isAnimated)
	}
	
}

extension SetTransition: UINavigationControllerDelegate {
	
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		guard let transitionCoordinator = navigationController.transitionCoordinator,
					let fromVC = transitionCoordinator.viewController(forKey: .from),
					let toVC = transitionCoordinator.viewController(forKey: .to) else { return }
		
		if fromVC == from {
			openCompletionHandler?()
			openCompletionHandler = nil
		} else if toVC == from {
			closeCompletionHandler?()
			closeCompletionHandler = nil
		}
	}
	
}
