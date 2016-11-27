//
//  HistoryInterfaceController.swift
//  Random
//
//  Created by Nick on 11/27/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import Foundation
import WatchKit

class HistoryInterfaceController : WKInterfaceController {
	
	@IBOutlet var historyTable: WKInterfaceTable!
	
	override func willActivate() {
		historyTable.setNumberOfRows(Random.history.count, withRowType: "HistoryRow")
		for index in 0 ..< Random.history.count {
			let (roll, date) = Random.history[index]
			if let controller = historyTable.rowController(at: index) as? HistoryRowController {
				controller.roll = roll
				controller.date = date
			}
		}
	}
	
	@IBAction func showUsage() {
		self.presentController(withName: "UsageScene", context: nil)
	}
	
	
}
