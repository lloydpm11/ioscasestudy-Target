//
//  DetailViewState.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation
import Tempo

// Detail view state
struct DetailViewState: TempoViewState {
    let title : String
    let price : String?
    let description : String
    let imageUrl : URL?
    
}

extension DetailViewState {
    init(from listItem: ListItemViewState) {
        self.init(title: listItem.title, price: listItem.price, description: listItem.description, imageUrl: listItem.url)
    }
}
