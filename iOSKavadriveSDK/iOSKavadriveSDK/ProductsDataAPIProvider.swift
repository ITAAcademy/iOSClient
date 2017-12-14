//
//  ProductDataAPIProvider.swift
//  iOSKavadriveSDK
//
//  Created by Nikolas Omelianov on 09.12.17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


public class ProductsDataAPIProvider {

    var productExample = DumbProduct()
    
    func readJsonFromRequest() {
        
        let url = URL(string: "http://kavadrive/api/v2/ua/products")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    let jsonProducts = json["products"] as? [String:Any]
                    let jsonData = jsonProducts!["data"] as! [Any]
                    for index in jsonData{//set data to struct
                        let productData = index as! [String:Any]
                        //variables for product structure
                        self.productExample.name = productData["name"] as! String
                        self.productExample.typeName = productData["type_name"] as! String
                        self.productExample.id = Int(productData["id"] as! String)!
                        self.productExample.amount = productData["amount"] as! String
                        self.productExample.price = Double(productData["price"] as! String)!
                        self.productExample.image = URL(string:(productData["image"] as! String))!
                        self.productExample.typeId = Int(productData["type_id"] as! String)!
                        self.productExample.categoryId = Int(productData["category_id"] as! String)!
                        self.productExample.categoryName = productData["actegory_name"] as! String
                        self.productExample.sequenceNumber = Int(productData["sequence_number_id"] as! String)!
                        self.productExample.description = productData["sequence_number_id"] as! String
                        //links
                        let links = productData["links"] as? [String:Any]
                        let linksJsonSelf = links!["self"] as? [String: Any]
                        self.productExample.links.append(URL(string: linksJsonSelf!["rel"] as! String)!)
                        self.productExample.links.append(URL(string: linksJsonSelf!["href"] as! String)!)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }
}
