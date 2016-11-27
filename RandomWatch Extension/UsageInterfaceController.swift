//
//  UsageInterfaceController.swift
//  Random
//
//  Created by Nick on 11/27/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import WatchKit
import Foundation


class UsageInterfaceController: WKInterfaceController {

	@IBOutlet var usageTable: WKInterfaceTable!
	@IBOutlet var loadingImage: WKInterfaceImage!
	
    override func willActivate() {
		self.loadingImage.setImageNamed("Activity")
		self.loadingImage.startAnimatingWithImages(in: NSRange(location: 0, length: 15), duration: 1.0, repeatCount: 0)
		loadingImage.setHidden(false)
		
		Random.getUsage { (status, creationTime, bitsLeft, requestsLeft, totalBits, totalRequests) in
			let usage: [(String, Any)] = [
				("Bits Left", bitsLeft),
				("Total Bits", totalBits),
				("Requests Left", requestsLeft),
				("Total Requests", totalRequests),
				("Key Status", status),
				("Key Created", creationTime),
			]
			
			self.usageTable.setNumberOfRows(usage.count, withRowType: "UsageRow")
			for index in 0 ..< usage.count {
				let (title, value) = usage[index]
				if let controller = self.usageTable.rowController(at: index) as? UsageRowController {
					controller.title = title
					controller.value = value
				}
			}
			
			self.loadingImage.stopAnimating()
			self.loadingImage.setHidden(true)
		}
    }

}
