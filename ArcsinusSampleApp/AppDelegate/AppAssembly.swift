//
//  AppAssembly.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import Foundation

enum AppAssembly {
	static func assembly() -> AppDependecies {
		let databaseManager = DBManager()
		let apiManager = APIManager()
		
		let feedService = FeedService(apiManager, databaseManager)
		return AppDependecies(feedService: feedService)
	}
}
