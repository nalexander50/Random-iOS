//
//  RandomStatsInterfaceController.swift
//  Random
//
//  Created by Nick Alexander on 11/21/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import WatchKit
import Foundation


class StatsInterfaceController: WKInterfaceController {
    
    @IBOutlet var statsTable: WKInterfaceTable!
    
    override func willActivate() {
        let stats = [
            ("Bit Requests Left", Random.bitRequestsLeft),
            ("API Requests Left", Random.apiRequestsLeft),
            ("Last Roll", Random.lastRoll)
        ]
        
        statsTable.setNumberOfRows(stats.count, withRowType: "StatsRow")
        for index in 0..<stats.count {
            let (title, value) = stats[index]
            if let controller = statsTable.rowController(at: index) as? StatsRowController {
                controller.title = title
                controller.value = value
            }
        }
    }
}
