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
    var id: Int  { get }
    var name: String { get }
    var amount: Int { get }
    var price: Double { get }
    var image: URL? { get }
    var typeId: Int { get }
    var typeName: String { get }
    var categoryId: Int { get }
    var categoryName: String { get }
    var sequenceNumber: Int { get }
    var descriprion: String { get }
    var links: [URL] { get }
}

public struct DumbProduct: ProductProtocol
{
    public var image: URL?

    public var descriprion: String { return "Dumb Description" }
    
    public var links: [URL] = []
    
    public var id: Int { return 1 }
    
    public var name: String { return "Dumb Name" }
    
    public var amount: Int { return 1 }
    
    public var price: Double { return 1 }
    
    public var typeId: Int { return 1 }
    
    public var typeName: String { return "Dumb Type Name" }
    
    public var categoryId: Int { return 1 }
    
    public var categoryName: String { return "Dumb Category Name" }
    
    public var sequenceNumber: Int { return 1 }
    
}


func readJsonFromFile() {
    do {
        if let file = Bundle.main.url(forResource: "ProductsAPI_JSON_exampleNEW", withExtension: "json") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            if let jsonProducts = json["products"] as? [String: Any] {
                let jsonData = jsonProducts["data"] as! [Any]
                //let jsonDataOne = jsonData[0] as? [String: Any]
                for index in jsonData{
                    let productData = index as! [String:Any]
                  //variables for product structure
                    let productName = productData["name"] as! String
                    let jsontTypeName = productData["type_name"] as? String
                    let jsonProductId = Int((productData["id"] as? String)!)
                    let jsonProductAmount = Int((productData["amount"] as? String)!)
                    let jsonProductPrice = Double((productData["price"] as? String)!)
                    let jsonProductImage = URL(string:(productData["image"] as? String)!)
                    let jsonProductTypeId = Int((productData["type_id"] as? String)!)
                    let jsonProductCategoryId = Int((productData["category_id"] as? String)!)
                    let jsonProductCategoryName = productData["actegory_name"] as? String
                    let jsonProductSequenceNumber = Int((productData["sequence_number_id"] as? String)!)
                    let jsonProductDescription = productData["sequence_number_id"] as? String
                //links
//                let linkArray = jsonDataOne!["links"] as? [Any]
//                let links = linkArray![0] as? [String:Any]
//                let linksRel = links!["rel"] as? String
//                let linksHref = links!["href"] as? String
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
