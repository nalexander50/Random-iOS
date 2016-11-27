//
//  UsageRowController.swift
//  Random
//
//  Created by Nick on 11/27/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import WatchKit

class UsageRowController: NSObject {

	@IBOutlet var valueLabel: WKInterfaceLabel!
	@IBOutlet var titleLabel: WKInterfaceLabel!
	
	var value: Any = 0 {
		didSet {
			if let intValue = self.value as? Int {
				self.valueLabel.setText(NumberFormatter(style: .decimal).string(from: intValue))
			} else if let stringValue = self.value as? String {
				if let dateValue = ISO8601DateFormatter().date(from: stringValue.replacingOccurrences(of: " ", with: "T")) {
					self.valueLabel.setText(DateFormatter(format: "M/d/yyyy").string(from: dateValue))
				} else {
					self.valueLabel.setText(stringValue.capitalized)
				}
			}
		}
	}
	
	var title: String = "Title" {
		didSet {
			self.titleLabel.setText(self.title)
		}
	}
	
}
