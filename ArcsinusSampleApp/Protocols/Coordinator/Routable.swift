//
//  Routable.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 14.03.2021.
//

import Foundation

protocol Routable {
	associatedtype Route

	func route(to route: Route, with transition: Transition)
}
