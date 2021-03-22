//
//  FeedTarget.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 20.03.2021.
//

import Moya

enum FeedTarget {
	case news(page: Int)
}

extension FeedTarget: TargetType {
	var baseURL: URL {
		return URL(string: "https://newsapi.org/v2")!
	}
	
	var path: String {
		switch self {
		case .news:
			return "/everything"
		}
	}
	
	var method: Method {
		switch self {
		case .news:
			return .get
		}
	}
	
	var sampleData: Data {
		return Data()
	}
	
	var task: Task {
		switch self {
		case .news(let page):
			return .requestParameters(parameters: ["q": "iOS", "page": page, "pageSize": 20], encoding: URLEncoding.queryString)
		}
	}
	
	var headers: [String : String]? {
		return ["Content-type": "application/json"]
	}
	
	
}
