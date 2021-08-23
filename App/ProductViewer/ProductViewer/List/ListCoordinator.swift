//
//  ListCoordinator.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Foundation
import Tempo

/*
 Coordinator for the product list
 */
class ListCoordinator: TempoCoordinator {
    
    // MARK: Presenters, view controllers, view state.
    
    var presenters = [TempoPresenterType]() {
        didSet {
            updateUI()
        }
    }
    
    fileprivate var viewState: ListViewState {
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
    
    lazy var viewController: ListViewController = {
        return ListViewController.viewControllerFor(coordinator: self)
    }()
    
    // MARK: Init
    
    required init() {
        viewState = ListViewState(listItems: [])
        registerListeners()
        updateState()
    }
    
    // MARK: ListCoordinator
    
    fileprivate func registerListeners() {
        dispatcher.addObserver(ListItemPressed.self) { [weak self] e in
            let detailCoordinator = DetailCoordinator(listItemState: e.listItemState)
            self?.viewController.navigationController?.pushViewController(detailCoordinator.viewController, animated: true)
        }
        
        dispatcher.addObserver(DealsLoading.self) { [weak self] e in
            self?.viewController.showActivityIndicator()
        }
        
        dispatcher.addObserver(DealsLoaded.self) { [weak self] e in
            self?.viewController.hideActivityIndicator()
        }
        
    }
    
    func updateState() {
        dispatcher.triggerEvent(DealsLoading())
        APIClient.getDeals { [weak self] result in
            switch result {
            case .success(let response):
                guard let deals = response.deals else {
                    return
                }
                self?.viewState.listItems = deals.map { deal in
                    return ListItemViewState(from: deal)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            self?.dispatcher.triggerEvent(DealsLoaded())
            self?.updateUI()
        }
    }
}
