//
//  Product.swift
//  iOSKavadriveSDK
//
//  Created by Aleksey Tyurenkov on 12/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import Foundation


public protocol ProductProtocol
{
    var id: Int  { get set }
    var name: String { get set }
    var amount: String { get set }
    var price: Double { get set }
    var image: URL? { get set }
    var typeId: Int { get set }
    var typeName: String { get set }
    var categoryId: Int { get set }
    var categoryName: String { get set }
    var sequenceNumber: Int { get set }
    var description: String { get set }
    var links: [URL] { get set }
}

public struct DumbProduct: ProductProtocol
{
    public var image: URL?

    public var description: String = ""
    
    public var links: [URL] = []
    
    public var id: Int = 0
    
    public var name: String = ""
    
    public var amount: String = ""
    
    public var price: Double = 0
    
    public var typeId: Int = 0
    
    public var typeName: String = ""
    
    public var categoryId: Int = 0
    
    public var categoryName: String = ""
    
    public var sequenceNumber: Int = 0
    
}

var productExample = DumbProduct()

func readJsonFromFile() {
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
                } //-----------
                
                print("----dictionary----")
            } else if let object = json as? [Any] {
                // json is an array
                print(object)
                print("----array-----")
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
                let jsonProduct = json["product"] as? [String:Any]
                
            }
        } catch let error {
            print(error.localizedDescription)
        }
    })
    
    task.resume()
}
