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
	@IBOutlet var rollButton: WKInterfaceButton!

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
		rollButton.setEnabled(false)
        self.resultLabel.setText("...")
        self.loadingImage.setImageNamed("Activity")
        self.loadingImage.startAnimatingWithImages(in: NSRange(location: 0, length: 15), duration: 1.0, repeatCount: 0)
		
		Random.rollDie { (result) in
			self.result = result
			self.loadingImage.stopAnimating()
			self.loadingImage.setImageNamed("Done")
			self.rollButton.setEnabled(true)
		}
    }
	
	@IBAction func showUsage() {
		self.presentController(withName: "UsageScene", context: nil)
	}
	
}
