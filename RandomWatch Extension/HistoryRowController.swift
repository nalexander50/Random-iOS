//
//  HistoryRowController.swift
//  Random
//
//  Created by Nick on 11/27/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import Foundation
import WatchKit

class HistoryRowController : NSObject {
	
	@IBOutlet var rollLabel: WKInterfaceLabel!
	@IBOutlet var dateLabel: WKInterfaceLabel!
	
	let dateFormatter = DateFormatter(format: "h:mma, M/d/yyyy")
	
	var roll: Int = 0 {
		didSet {
			self.rollLabel.setText(self.roll.description)
		}
	}
	
	var date: Date = Date() {
		didSet {
			self.dateLabel.setText(self.dateFormatter.string(from: self.date))
		}
	}
	
}
