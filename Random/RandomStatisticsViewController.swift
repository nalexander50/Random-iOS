//
//  RandomStatisticsViewController.swift
//  Random
//
//  Created by Nick Alexander on 11/21/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import UIKit

class RandomStatisticsViewController: UIViewController {
    
    
    @IBOutlet weak var lastRollLabel: UILabel!
    @IBOutlet weak var bitRequestsLabel: UILabel!
    @IBOutlet weak var apiRequestsLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        lastRollLabel.text = Random.lastRoll.description
        bitRequestsLabel.text = NumberFormatter.init(style: .decimal).string(from: NSNumber(value: Random.bitRequestsLeft))
        apiRequestsLabel.text = NumberFormatter.init(style: .decimal).string(from: NSNumber(value: Random.apiRequestsLeft))
    }

}
