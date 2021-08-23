//
//  DetailPresenter.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation
import Tempo

class DetailPresenter : TempoPresenter {
    
    var dispatcher: Dispatcher?
    var detailViewController : DetailViewController!

    init (detailController : DetailViewController,
          dispatcher: Dispatcher) {
        detailViewController = detailController
        self.dispatcher = dispatcher
    
    }
    
    
    func present(_ viewState: DetailViewState) {
        
        detailViewController.navigationItem.title = viewState.title
        detailViewController.priceLabel.text = viewState.price
        detailViewController.descriptionLabel.text = viewState.description
        detailViewController.thumbnailImage.setImage(for: viewState.imageUrl)
        
    }
}
