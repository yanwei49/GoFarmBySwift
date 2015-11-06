//
//  Parser.swift
//  GoFarmBySwift
//
//  Created by David Yu on 6/11/15.
//  Copyright © 2015年 &#39068.stringValue&#39759.stringValue. All rights reserved.
//

import UIKit
import SwiftyJSON

private let manager = Parser()

class Parser: NSObject {

    //创建单例
    class var shareInstance: Parser {
        get {
            return manager
        }
    }
    
    func userWithData(data: JSON) -> UserModel {
        let user = UserModel()
        
        
        return user
    }

    func productWithData(data: JSON) -> ProductModel {
        let product = ProductModel()
        
        product.productId = data["productId"].stringValue
        product.productName = data["productName"].stringValue
        product.productUnit = data["productUnit"].stringValue
        product.productCityName = data["productCityName"].stringValue
        product.productCollectState = data["productCollectState"].stringValue
        product.productImages = data["productImages"].stringValue.componentsSeparatedByString("|")
        product.productStars = data["productStar"].stringValue
        if (data["productStore"] != nil) {
            let store = StoreModel()
            store.storeName = data["storeName"].stringValue
            product.productStore = store
        }else {
            product.productStore = storeWithData(data["productStore"])
        }
        product.productBriefContent = data["productInfos"].stringValue
        product.productCommentState = data["productCommentState"].stringValue
        product.productPurchaseQuantity = data["productPurchaseQuantity"].stringValue
        product.productOriginalPrice = data["productOriginalPrice"].stringValue
        product.productCurrentPrice = data["productCurrentPrice"].stringValue
        product.productSelledQuantity = data["productSellCount"].stringValue
        product.productUseRule = data["productUseRule"].stringValue
        product.productRemainQuantity = data["productRemainCount"].stringValue
        product.productActiviteInfos = data["productActiviteInfos"].stringValue
        product.productCommentArray = commentArrayWithData(data["productComments"])
        product.productCommandArray = productArrayWithData(data["commandProduct"])
        
        return product
    }

    func storeWithData(data: JSON) -> StoreModel {
        let store = StoreModel()
        
        
        return store
    }
    
    func trendsWithData(data: JSON) -> TrendsModel {
        let trends = TrendsModel()
        
        
        return trends
    }
    
    func commentWithData(data: JSON) -> CommentModel {
        let comment = CommentModel()
        
        
        return comment
    }
    
    func dataArrayWithData(data: AnyObject, type: String) -> [AnyObject] {
        var array = [AnyObject]()
        let dict = JSON(data).dictionaryValue
        for i in 0 ..< (dict[type]?.arrayValue)!.count {
            switch type {
                case "imageAdverts":
                    array.append(productWithData(dict[type]![i]))
                case "textAdverts":
                    array.append(productWithData(dict[type]![i]))
                case "hotProducts":
                    array.append(productWithData(dict[type]![i]))
                case "hotStores":
                    array.append(storeWithData(dict[type]![i]))
                case "nearbyProducts":
                    array.append(productWithData(dict[type]![i]))
                default:
                    print("")
            }
        }
        
        return array
    }
    
    func storeArrayWithData(data: JSON) -> [StoreModel] {
        var array = [StoreModel]()
        for i in 0 ..< data.arrayValue.count {
            array.append(storeWithData(data.arrayValue[i]))
        }
        return array
    }
    
    func productArrayWithData(data: JSON) -> [ProductModel] {
        var array = [ProductModel]()
        for i in 0 ..< data.arrayValue.count {
            array.append(productWithData(data.arrayValue[i]))
        }
        return array
    }
    
    func trendsArrayWithData(data: JSON) -> [TrendsModel] {
        var array = [TrendsModel]()
        for i in 0 ..< data.arrayValue.count {
            array.append(trendsWithData(data.arrayValue[i]))
        }
        return array
    }
    
    func commentArrayWithData(data: JSON) -> [CommentModel] {
        var array = [CommentModel]()
        for i in 0 ..< data.arrayValue.count {
            array.append(commentWithData(data.arrayValue[i]))
        }
        return array
    }
    
    
}
