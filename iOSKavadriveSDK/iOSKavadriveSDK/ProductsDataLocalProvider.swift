//
//  ProductDataLocalProvider.swift
//  iOSKavadriveSDK
//
//  Created by Nikolas Omelianov on 09.12.17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


public class ProductsDataLocalProvider {

   var productExample = DumbProduct()
    
   public func readJsonFromFile() {
        do {
            if let file = Bundle.main.url(forResource: "ProductsAPI_JSON_exampleNEW", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                if let jsonProducts = json["products"] as? [String: Any] {
                    let jsonData = jsonProducts["data"] as! [Any]
                    for index in jsonData{//set data to struct
                        let productData = index as! [String:Any]
                        //variables for product structure
                        productExample.name = productData["name"] as! String
                        productExample.typeName = productData["type_name"] as! String
                        productExample.id = Int(productData["id"] as! String)!
                        productExample.amount = productData["amount"] as! String
                        productExample.price = Double(productData["price"] as! String)!
                        productExample.image = URL(string:(productData["image"] as! String))!
                        productExample.typeId = Int(productData["type_id"] as! String)!
                        productExample.categoryId = Int(productData["category_id"] as! String)!
                        productExample.categoryName = productData["actegory_name"] as! String
                        productExample.sequenceNumber = Int(productData["sequence_number_id"] as! String)!
                        productExample.description = productData["sequence_number_id"] as! String
                        //links
                        let links = productData["links"] as? [String:Any]
                        let linksJsonSelf = links!["self"] as? [String: Any]
                        productExample.links.append(URL(string: linksJsonSelf!["rel"] as! String)!)
                        productExample.links.append(URL(string: linksJsonSelf!["href"] as! String)!)
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
