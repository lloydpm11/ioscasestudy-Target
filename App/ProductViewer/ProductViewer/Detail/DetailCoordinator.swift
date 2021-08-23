//
//  DetailCoordinator.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//


import Foundation
import Tempo
import Lightbox

class DetailCoordinator: TempoCoordinator {
    
    // MARK: Presenters, view controllers, view state.
    
    var presenters = [TempoPresenterType]() {
        didSet {
            updateUI()
        }
    }
    
    fileprivate var viewState: DetailViewState {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        for presenter in presenters {
            presenter.present(viewState)
        }
    }
    
    let dispatcher = Dispatcher()
    
    lazy var viewController: UIViewController = {
        return DetailViewController.viewControllerFor(coordinator: self)
    }()
    
    init(listItemState : ListItemViewState) {
        viewState = DetailViewState(from: listItemState)
        
        updateUI()
        registerListeners()
    }
    
    fileprivate func registerListeners() {
        dispatcher.addObserver(AddToCartPressed.self) { [weak self] e in
            let alert = UIAlertController(title: "Alert", message: "Item added to the cart", preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil) )
            self?.viewController.present(alert, animated: true, completion: nil)
        }
        
        dispatcher.addObserver(AddToListPressed.self) { [weak self] e in
            let alert = UIAlertController(title: "Alert", message: "Item added to the list", preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil) )
            self?.viewController.present(alert, animated: true, completion: nil)
        }
        
        dispatcher.addObserver(ZoomImage.self) { [weak self] e in
            self?.zoomImage()
        }
    }
    
    fileprivate func zoomImage() {
        guard let url = viewState.imageUrl  else {
            return
        }
        let images = [LightboxImage(imageURL: url, text: viewState.title)]
        let imageViewController = LightboxController(images: images)
        imageViewController.modalPresentationStyle = .fullScreen
        viewController.present(imageViewController, animated: true)
    }
}
