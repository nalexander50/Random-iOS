//
//  DieInterfaceController.swift
//  Random
//
//  Created by Nick Alexander on 11/21/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import WatchKit
import Foundation


class DieInterfaceController: WKInterfaceController {

    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var loadingImage: WKInterfaceImage!

    var result: Int = 0 {
        didSet {
            self.resultLabel.setText(result.description)
        }
    }
    
    
    override func awake(withContext context: Any?) {
        self.resultLabel.setText("...")
        self.loadingImage.setImageNamed("Done")
    }
    
    @IBAction func roll() {
        self.resultLabel.setText("...")
        self.loadingImage.setImageNamed("Activity")
        self.loadingImage.startAnimatingWithImages(in: NSRange(location: 0, length: 15), duration: 1.0, repeatCount: 0)
        
        Random.rollDie { (result, bitsLeft, requestsLeft) in
            self.result = result
            self.loadingImage.stopAnimating()
            self.loadingImage.setImageNamed("Done")
        }
    }
}
