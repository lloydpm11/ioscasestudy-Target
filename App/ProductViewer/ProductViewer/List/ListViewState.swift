//
//  ListViewState.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Tempo

/// List view state
struct ListViewState: TempoViewState, TempoSectionedViewState {
    var listItems: [TempoViewStateItem]
    
    var sections: [TempoViewStateItem] {
        return listItems
    }
}

/// View state for each list item.
struct ListItemViewState: TempoViewStateItem, Equatable {
    let title: String
    let price: String?
    let description: String
    let image: UIImage?
    let url : URL?
    let aisle : String

}

func ==(lhs: ListItemViewState, rhs: ListItemViewState) -> Bool {
    return lhs.title == rhs.title
        && lhs.price == rhs.price
        && lhs.image == rhs.image
}

extension ListItemViewState {
    init(from deal: Deal) {
        self.init(title: deal.title, price: deal.regularPrice, description: deal.description, image: UIImage(named: "placeholder"), url: deal.url, aisle: deal.aisle)
    }
}
