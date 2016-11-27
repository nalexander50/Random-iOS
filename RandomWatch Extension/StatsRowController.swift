//
//  StatsRowController.swift
//  Random
//
//  Created by Nick Alexander on 11/21/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import WatchKit

class StatsRowController: NSObject {

    @IBOutlet var valueLabel: WKInterfaceLabel!
    @IBOutlet var titleLabel: WKInterfaceLabel!
    
    var value: Int = 0 {
        didSet {
            valueLabel.setText(NumberFormatter(style: .decimal).string(from: self.value))
        }
    }
    
    var title: String = "Title" {
        didSet {
            titleLabel.setText(self.title)
        }
    }
    
}
