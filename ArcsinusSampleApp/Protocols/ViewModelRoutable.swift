//
//  ViewModelRoutable.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 14.03.2021.
//

import RxSwift

protocol ViewModelRoutable {
	associatedtype RouteAction
	var route: PublishSubject<RouteAction> { get }
}
