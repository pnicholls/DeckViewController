//
//  DeckView.swift
//  DeckViewController
//
//  Created by Peter Nicholls on 8/10/2015.
//  Copyright © 2015 Peter Nicholls. All rights reserved.
//

import Foundation
import UIKit

protocol DeckViewDelegate: NSObjectProtocol {
    
}

protocol DeckViewDataSource: NSObjectProtocol {
    func numberOfCardsInDeckView(deckView: DeckView) -> Int
    func deckView(deckView: DeckView, viewControllerForCardAtIndex index: Int) -> UIViewController
}

class DeckView: UIView {
    
    // MARK: - Internal Properties
    
    weak var dataSource: DeckViewDataSource?

    weak var delegate: DeckViewDelegate?

    // MARK: - Private Properties
    
    // MARK: - Initalizers
    
    // MARK: - UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
    
    private func configure() {
        backgroundColor = .blueColor()
    }
}