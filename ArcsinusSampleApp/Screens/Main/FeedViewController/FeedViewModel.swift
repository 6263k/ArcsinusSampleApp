//
//  FeedViewModel.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 14.03.2021.
//

import RxSwift

final class FeedViewModel: BaseViewModel, ViewModelRoutable {
	enum RouteAction {
		case showDetails
		case presentFilters
	}
	
	let route = PublishSubject<RouteAction>()
	let nextButtonPressed = PublishSubject<Void>()
	
	let disposeBag = DisposeBag()
	
	override func setupModel() {
		super.setupModel()
		
		nextButtonPressed.map { _ -> RouteAction in
			return .showDetails
		}.bind(to: route).disposed(by: disposeBag)
	}
}
