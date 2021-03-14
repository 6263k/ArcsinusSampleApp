//
//  Coordinatable.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 14.03.2021.
//

import UIKit

protocol Coordinatable {
	var navigationController: UINavigationController { get }

	func start()
}
