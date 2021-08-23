//
//  Constants.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//
import Foundation

struct ServerConstants {
    static let baseURL = "https://api.target.com/mobile_case_study_deals/v1"
    
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
