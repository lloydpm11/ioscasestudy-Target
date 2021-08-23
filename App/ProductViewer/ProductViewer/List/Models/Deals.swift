//
//  Deals.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation
struct Deals: Codable {
    
    let deals : [Deal]?
    
    enum CodingKeys: String, CodingKey {
      case  deals = "products"
    }
}
