//
//  MultiMoyaProvider.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 20.03.2021.
//

import Moya
import RxSwift

final class MultiMoyaProvider: MoyaProvider<MultiTarget> {
	typealias Target = MultiTarget
	
	override init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
								requestClosure: @escaping RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
								stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
								callbackQueue: DispatchQueue? = nil,
								session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
								plugins: [PluginType] = [],
								trackInflights: Bool = false) {
		super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: callbackQueue, session: session, plugins: plugins, trackInflights: trackInflights)
	}
}

extension MultiMoyaProvider {
	
	func request(_ target: Target) -> Single<Result<Data, APIError>> {
		return Single.create { [weak self] (single) -> Disposable in
			let request = self?.request(target, completion: { (result) in
				switch result {
				case .success(let response):
					single(.success(.success(response.data)))
				case .failure(let error):
					let apiError = APIError.from(error)
					single(.success(.failure(apiError)))
				}
			})
			
			return Disposables.create {
				request?.cancel()
			}
		}
	}
	
}
