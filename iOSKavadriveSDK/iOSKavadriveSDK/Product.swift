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


func readJson() {
    do {
        if let file = Bundle.main.url(forResource: "ProductsAPI_JSON_example", withExtension: "json") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            if let jsonProducts = json["products"] as? [String: Any] {
                let jsonData = jsonProducts["data"] as! [Any]
                let jsonDataOne = jsonData[0] as? [String: Any]
                //variables for product structure
                let jsontTypeName = jsonDataOne!["type_name"] as? String
                let jsonProductId = Int((jsonDataOne!["id"] as? String)!)
                let jsonProductName = jsonDataOne!["name"] as? String
                let jsonProductAmount = Int((jsonDataOne!["amount"] as? String)!)
                let jsonProductPrice = Double((jsonDataOne!["price"] as? String)!)
                let jsonProductImage = URL(string:(jsonDataOne!["image"] as? String)!)
                let jsonProductTypeId = Int((jsonDataOne!["type_id"] as? String)!)
                let jsonProductCategoryId = Int((jsonDataOne!["category_id"] as? String)!)
                let jsonProductCategoryName = jsonDataOne!["actegory_name"] as? String
                let jsonProductSequenceNumber = Int((jsonDataOne!["sequence_number_id"] as? String)!)
                let jsonProductDescription = jsonDataOne!["sequence_number_id"] as? String
                //-----------
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

