//
//  ViewController.swift
//  DeckViewController
//
//  Created by Peter Nicholls on 8/10/2015.
//  Copyright © 2015 Peter Nicholls. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        presentFeedViewController()
    }

    
    private func presentFeedViewController() {
        let feedViewController = FeedViewController()
        presentViewController(feedViewController, animated: true, completion: nil)
    }
}

