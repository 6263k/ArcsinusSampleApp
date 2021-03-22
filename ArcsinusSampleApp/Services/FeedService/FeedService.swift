//
//  FeedService.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import RxSwift

protocol HasFeedService {
	var feedService: FeedService { get }
}

final class FeedService {
	private let apiManager: APIManager
	private let databaseManager: DBManager
	
	private let disposeBag = DisposeBag()
	init(_ apiManager: APIManager, _ databaseManager: DBManager) {
		self.apiManager = apiManager
		self.databaseManager = databaseManager
		test()
	}

	func test() {
		apiManager.request(FeedTarget.news(page: 1)).map(to: Test.self).subscribe(onSuccess: { result in
			switch result {
			case .failure(let error):
				print(error.localizedDescription)
			case .success(let obj):
				print(obj)
			}
		}).disposed(by: disposeBag)
	}
	
}

struct Test: Decodable, CustomStringConvertible {
	let status: String
	
	var description: String {
		return "Object status is " + status
	}
}
