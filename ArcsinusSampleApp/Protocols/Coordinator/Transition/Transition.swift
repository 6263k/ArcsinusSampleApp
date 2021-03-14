//
//  Transition.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 14.03.2021.
//

import UIKit

protocol Transition {
	var isAnimated: Bool { get set }
	
	func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?)
	func close(_ viewController: UIViewController, completion: (() -> Void)?)
}
