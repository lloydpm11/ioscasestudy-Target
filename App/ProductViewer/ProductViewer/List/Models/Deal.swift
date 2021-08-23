//
//  Deal.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation

struct Deal: Codable {
     let id : Int
     let aisle : String
     let title : String
     let description : String
     let url : URL?
     let regularPrice : String?
     let salePrice : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case aisle
        case title
        case description
        case url = "image_url"
        case regularPrice = "regular_price"
        case salePrice = "sale_price"
    }
    
    enum PriceCodingKeys: String, CodingKey {
        case price = "display_string"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        aisle = try container.decode(String.self, forKey: .aisle)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        url = URL(string: try container.decode(String.self, forKey: .url))
        
        let regularPriceContainer = try? container.nestedContainer(keyedBy: PriceCodingKeys.self, forKey: .regularPrice)
        regularPrice = try? regularPriceContainer?.decode(String.self, forKey: .price)
        
        let salePriceContainer = try? container.nestedContainer(keyedBy: PriceCodingKeys.self, forKey: .salePrice)
        salePrice = try? salePriceContainer?.decode(String.self, forKey: .price)
    }
}
