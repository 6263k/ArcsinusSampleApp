//
//  APIManager.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 13.03.2021.
//

import RxSwift
import Moya

protocol HasAPIManager {
	var apiManager: APIManager { get }
}

final class APIManager {
	private let session: Session
	private let provider: MultiMoyaProvider
	
	init() {
		self.session = Session(configuration: .default)
		let loggerPlugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
		let authorizationPlugin = AuthorizationPlugin(apiKey: "7cf652ab6f924f8b87d06a46293e3f43")
		self.provider = MultiMoyaProvider(callbackQueue: DispatchQueue.main, session: session, plugins: [loggerPlugin, authorizationPlugin])
	}
	
	func request(_ target: TargetType) -> Single<Result<Data, APIError>> {
		return provider.request(MultiTarget(target))
	}
}
