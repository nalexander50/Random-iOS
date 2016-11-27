//
//  Random.swift
//  Random
//
//  Created by Nick Alexander on 11/20/16.
//  Copyright © 2016 Nick Alexander. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Random {
    
    static let url = "https://api.random.org/json-rpc/1/invoke"
    static let params: [String : Any] = [
        "id" : 901586474,
        "jsonrpc" : "2.0",
        "method" : "generateIntegers",
        "params" : [
            "apiKey" : "3acb753b-9bf4-4a63-b998-d9060e6f4976",
            "n" : 1,
            "min" : 1,
            "max" : 6
        ]
    ]
    
    static var lastRoll: Int = 0
    static var bitRequestsLeft: Int = 0
    static var apiRequestsLeft: Int = 0
    
    
    class func rollDie(_ completionHandler: @escaping (Int, Int, Int) -> ()) {
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: ["Content-Type" : "application/json"]).responseJSON { (response) in
            if let responseData = response.data {
                
                var json = JSON(data: responseData)
                let bitsUsed = json["result"]["bitsUsed"].int ?? -1
                let bitsLeft = json["result"]["bitsLeft"].int ?? -1
                
                lastRoll = json["result"]["random"]["data"][0].int ?? -1
                apiRequestsLeft = json["result"]["requestsLeft"].int ?? -1
                bitRequestsLeft = bitsLeft / bitsUsed
                
                completionHandler(lastRoll, bitRequestsLeft, apiRequestsLeft)
            }
        }
    }
    
}
