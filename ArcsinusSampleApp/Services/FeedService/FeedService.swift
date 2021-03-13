//
//  FeedService.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import Foundation

protocol HasFeedService {
	var feedService: FeedService { get }
}

final class FeedService {
	private let apiManager: APIManager
	private let databaseManager: DBManager
	
	init(_ apiManager: APIManager, _ databaseManager: DBManager) {
		self.apiManager = apiManager
		self.databaseManager = databaseManager
	}
	
	func getFeed() -> [String] {
		return ["123"]
	}
	
}
