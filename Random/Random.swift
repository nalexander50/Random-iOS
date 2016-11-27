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
	
	static var history: [(Int, Date)] = [(Int, Date)]()
    static let url = "https://api.random.org/json-rpc/1/invoke"
    static let rollDieParams: [String : Any] = [
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
	static let getUsageParams: [String : Any] = [
		"id" : 901586474,
		"jsonrpc" : "2.0",
		"method" : "getUsage",
		"params" : [
			"apiKey" : "3acb753b-9bf4-4a63-b998-d9060e6f4976"
		]
	]
	
    class func rollDie(_ completionHandler: @escaping (Int) -> ()) {
        Alamofire.request(url, method: .post, parameters: rollDieParams, encoding: JSONEncoding.default, headers: ["Content-Type" : "application/json"]).responseJSON { (response) in
            if let responseData = response.data {
                var json = JSON(data: responseData)
                let lastRoll = json["result"]["random"]["data"][0].int ?? -1
				addHistory(roll: lastRoll)
                completionHandler(lastRoll)
            }
        }
    }
	
	class func getUsage(_ completionHandler: @escaping (String, String, Int, Int, Int, Int) -> ()) {
		Alamofire.request(url, method: .post, parameters: getUsageParams, encoding: JSONEncoding.default, headers: ["Content-Type" : "application/json"]).responseJSON { (response) in
			if let responseData = response.data {
				var json = JSON(data: responseData)
				let status = json["result"]["status"].stringValue
				let keyCreationDate = json["result"]["creationTime"].stringValue
				let bitsLeft = json["result"]["bitsLeft"].intValue
				let requestsLeft = json["result"]["requestsLeft"].intValue
				let totalBitsUsed = json["result"]["totalBits"].intValue
				let totalRequestsSent = json["result"]["totalRequests"].intValue
				completionHandler(status, keyCreationDate, bitsLeft, requestsLeft, totalBitsUsed, totalRequestsSent)
			}
		}
	}
	
	private class func addHistory(roll: Int) {
		history.insert((roll, Date()), at: 0)
		if (history.count == 10) {
			let _ = history.popLast()
		}
	}
    
}
