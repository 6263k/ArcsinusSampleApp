//
//  ModalTransition.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 14.03.2021.
//

import UIKit

final class ModalTransition: NSObject {
	var isAnimated: Bool = true
	
	var modalTransitionStyle: UIModalTransitionStyle
	var modalPresentationStyle: UIModalPresentationStyle
	
	init(isAnimated: Bool = true,
			 modalTransitionStyle: UIModalTransitionStyle = .coverVertical,
			 modalPresentationStyle: UIModalPresentationStyle = .automatic) {
		self.isAnimated = isAnimated
		self.modalTransitionStyle = modalTransitionStyle
		self.modalPresentationStyle = modalPresentationStyle
	}
}

extension ModalTransition: Transition {
	func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {
		viewController.modalPresentationStyle = modalPresentationStyle
		viewController.modalTransitionStyle = modalTransitionStyle
		from.present(viewController, animated: isAnimated, completion: completion)
	}
	
	func close(_ viewController: UIViewController, completion: (() -> Void)?) {
		viewController.dismiss(animated: isAnimated, completion: completion)
	}
}
