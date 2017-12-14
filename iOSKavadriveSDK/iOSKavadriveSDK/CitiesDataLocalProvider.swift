//
//  CitiesDataLocalProvider.swift
//  iOSKavadriveSDK
//
//  Created by Nikolas Omelianov on 14.12.17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


public class CitiesDataLocalProvider {
    
    var cityExample = DumbProduct()
    
    public func readJsonFromFile() {
        do {
            if let file = Bundle.main.url(forResource: "CitiesJson", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                if let jsonCities = json["cities"] as? [String: Any] {
                    let jsonData = jsonCities["data"] as! [Any]
                    for index in jsonData{//set data to struct
                        let cityData = index as! [String:Any]
                        //variables for city structure
                        cityExample.name = cityData["name"] as! String
                        cityExample.id = Int(cityData["id"] as! String)!
                        //links
                        let links = cityData["links"] as? [String:Any]
                        cityExample.links.append(URL(string: links!["rel"] as! String)!)
                        cityExample.links.append(URL(string: links!["href"] as! String)!)
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
