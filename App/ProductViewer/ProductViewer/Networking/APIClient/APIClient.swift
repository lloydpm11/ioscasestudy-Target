//
//  APIClient.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Alamofire
import Foundation

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(endpoint: EndPoint, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(endpoint)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    
    static func getDeals(completion:@escaping (Result<Deals, AFError>)->Void) {
        performRequest(endpoint: DealsAPIRouter.deals, completion: completion)
    }
}

