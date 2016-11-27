//
//  DateFormatterExtension.swift
//  Random
//
//  Created by Nick on 11/27/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import Foundation
extension DateFormatter {
	
	convenience init(format: String) {
		self.init()
		self.dateFormat = format
	}
	
}
