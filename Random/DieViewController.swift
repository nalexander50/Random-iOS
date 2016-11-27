//
//  RandomIntegerViewController.swift
//  Random
//
//  Created by Nick Alexander on 11/20/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import UIKit
import Async

class DieViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var result: Int = 0 {
        didSet {
            self.resultLabel.text = result.description
            toggleViewStatus()
        }
    }
    
    @IBAction func roll(_ sender: AnyObject) {
        toggleViewStatus()
        Random.rollDie { (result) in
            Async.main {
                self.result = result
            }
        }
    }
    
    func toggleViewStatus() {
        self.resultLabel.isHidden = !self.resultLabel.isHidden
        self.loadingIndicator.isHidden = !self.loadingIndicator.isHidden
        if (self.loadingIndicator.isAnimating) {
            self.loadingIndicator.stopAnimating()
        } else {
            self.loadingIndicator.startAnimating()
        }
    }

}
