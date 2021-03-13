//
//  Storyboardable.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import UIKit

protocol Storyboardable {
	static func instatiate(with storyboard: Storyboard) -> UIViewController
}

extension Storyboardable where Self: UIViewController {
	static func instatiate(with storyboard: Storyboard) -> UIViewController {
		let identifier = String(describing: self)
		return UIStoryboard(name: storyboard.rawValue, bundle: .main).instantiateViewController(withIdentifier: identifier)
	}
}

enum Storyboard: String {
	case main = "Main"
}
