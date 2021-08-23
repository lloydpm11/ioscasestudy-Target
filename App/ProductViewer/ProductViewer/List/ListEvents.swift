//
//  ListEvents.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Tempo

struct ListItemPressed: EventType {
    let listItemState : ListItemViewState
}

struct DealsLoading: EventType {}

struct DealsLoaded: EventType {}
