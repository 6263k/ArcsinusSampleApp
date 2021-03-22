//
//  AuthorizationPlugin.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 20.03.2021.
//

import Moya

struct AuthorizationPlugin: PluginType {
	private let apiKey: String
	
	init(apiKey: String) {
		self.apiKey = apiKey
	}
	
	func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
		guard let url = request.url else { return request }
		
		var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
		let apiKeyQueryItem = URLQueryItem(name: "apiKey", value: apiKey)
		components?.queryItems?.append(apiKeyQueryItem)
		
		var request = request
		request.url = components?.url
		
		return request
	}
	
}
