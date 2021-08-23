//
//  ProductListComponent.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Tempo

struct ProductListComponent: Component {
    var dispatcher: Dispatcher?

    func prepareView(_ view: ProductListView, item: ListItemViewState) {
        // Called on first view or ProductListView
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1.0
        view.layer.borderColor = HarmonyColor.targetStrokeGrayColor.cgColor
        
        view.aisleLabel.layer.cornerRadius =  view.aisleLabel.frame.size.height / 2
        view.aisleLabel.layer.borderWidth = 2.0
        view.aisleLabel.layer.borderColor = HarmonyColor.targetStrokeGrayColor.cgColor
        view.aisleLabel.textColor = HarmonyColor.targetBullseyeRedColor
    }
    
    func configureView(_ view: ProductListView, item: ListItemViewState) {
        view.titleLabel.text = item.title
        view.priceLabel.text = item.price
        view.productImage.setImage(for: item.url, placeHolderImage: item.image)
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string:"ship", attributes:[NSAttributedString.Key.foregroundColor : HarmonyColor.targetJetBlackColor]))
        attributedString.append(NSAttributedString(string:" or", attributes: [NSAttributedString.Key.foregroundColor : HarmonyColor.targetStrokeGrayColor]))
        view.shipLabel.attributedText = attributedString
    }
    
    
    func selectView(_ view: ProductListView, item: ListItemViewState) {
        dispatcher?.triggerEvent(ListItemPressed(listItemState: item))
    }
}

extension ProductListComponent: HarmonyLayoutComponent {
    func heightForLayout(_ layout: HarmonyLayout, item: TempoViewStateItem, width: CGFloat) -> CGFloat {
        return 130.0
    }
}
