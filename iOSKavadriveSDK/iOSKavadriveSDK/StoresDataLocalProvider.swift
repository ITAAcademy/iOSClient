//
//  StoresDataLocalProvider.swift
//  iOSKavadriveSDK
//
//  Created by Nikolas Omelianov on 14.12.17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation

public class StoresDataLocalProvider {
    
    var storeExample = DumbStore()
    
    public func readJsonFromFile() {
        do {
            if let file = Bundle.main.url(forResource: "StoresJson", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                if let jsonStores = json["stores"] as? [String: Any] {
                    let jsonData = jsonStores["data"] as! [Any]
                    for index in jsonData{//set data to struct
                        let storeData = index as! [String:Any]
                        //variables for store structure
                        storeExample.name = storeData["name"] as! String
                        storeExample.cityName = storeData["type_name"] as! String
                        storeExample.id = Int(storeData["id"] as! String)!
                        storeExample.latitude = Double(storeData["latitude"] as! String)!
                        storeExample.longitude = Double(storeData["longitude"] as! String)!
                        storeExample.adress = storeData["adress"] as! String
                        storeExample.openingTime = storeData["opening_time"] as! String
                        storeExample.closingTime = storeData["closing_time"] as! String
                        //links
                        let links = storeData["links"] as? [String:Any]
                        storeExample.links.append(URL(string: links!["rel"] as! String)!)
                        storeExample.links.append(URL(string: links!["href"] as! String)!)
                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }

}
