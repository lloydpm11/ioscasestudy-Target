//
//  APIRouter.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//
import Alamofire
import Foundation

protocol EndPoint: URLRequestConvertible {
    var baseUrl: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

extension EndPoint {
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

enum DealsAPIRouter: EndPoint {
    
    case deals
    
    var baseUrl: String {
        switch self {
        case .deals:
            return ServerConstants.baseURL
        }
    }
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .deals:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .deals:
            return "/deals"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        return nil
    }
}

