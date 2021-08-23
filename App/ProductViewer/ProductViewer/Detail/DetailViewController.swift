//
//  DetailViewController.swift
//  ProductViewer
//
//  Created by Lloyd on 22/08/21.
//  Copyright © 2021 Target. All rights reserved.
//

import UIKit
import Tempo

class DetailViewController: UIViewController {
    
    class func viewControllerFor(coordinator: TempoCoordinator) -> UIViewController {
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.coordinator = coordinator as? DetailCoordinator
        
        return detailViewController
    }
    
    fileprivate var coordinator: DetailCoordinator!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var addToListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinator.presenters = [DetailPresenter(detailController:self,
                                                      dispatcher:coordinator.dispatcher)]
        addToCartButton.layer.cornerRadius = 5
        addToListButton.layer.cornerRadius = 5
        priceLabel.textColor = HarmonyColor.targetJetBlackColor
        priceLabel.textColor = HarmonyColor.targetJetBlackColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
    }
    
    @IBAction func addToCartTapped(_ sender: Any) {
        coordinator.dispatcher.triggerEvent(AddToCartPressed())
    }
    
    @IBAction func addToListTapped(_ sender: Any) {
        coordinator.dispatcher.triggerEvent(AddToListPressed())
    }
    
    @IBAction func zoomImage(_ sender: Any) {
        coordinator.dispatcher.triggerEvent(ZoomImage())
    }
}

