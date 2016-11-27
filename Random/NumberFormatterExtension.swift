//
//  NSNumberExtension.swift
//  Random
//
//  Created by Nick Alexander on 11/21/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    convenience init(style: NumberFormatter.Style) {
        self.init()
        self.numberStyle = style
    }
    
    func string(from value: Int) -> String? {
        return self.string(from: NSNumber(value: value))
    }
    
}
