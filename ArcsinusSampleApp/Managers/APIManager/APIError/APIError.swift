//
//  APIError.swift
//  ArcsinusSampleApp
//
//  Created by Danil Blinov on 20.03.2021.
//

import Moya

enum APIError: Error {
	case invalidData
	case requestFaild
	case jsonConversationFailed
	case moya
	
	static func from(_ error: MoyaError) -> APIError {
		return .moya
	}
	
	var localizedDescription: String {
		switch self {
		case .invalidData:
			return "Неправильные данные"
		default:
			return "Не пошло не фартануло"
		}
	}
}
