//
//  ProductModel.swift
//  GoFarmBySwift
//
//  Created by David Yu on 23/10/15.
//  Copyright © 2015年 &#39068 = ""&#39759 = "". All rights reserved.
//

import Foundation

class ProductModel: NSObject {

    var  productId = ""                              //产品的ID
    var  productName = ""                            //产品的名称
    var  productImages = [String]()                  //产品的图片
    var  productStars = ""                           //产品的星级
    var  productStore = StoreModel()                 //产品的所属商铺
    var  productBriefContent = ""                    //产品的简介
    var  productOriginalPrice = ""                   //产品的原价
    var  productCurrentPrice = ""                    //产品的现价
    var  productPurchaseQuantity = ""                //产品的购买数量
    var  productSelledQuantity = ""                  //产品的已出售数量
    var  productRemainQuantity = ""                  //产品的剩余数量
    var  productActiviteInfos = ""                   //产品的活动信息
    var  productCommentArray = [CommentModel]()      //产品的评论列表
    var  productCommandArray = [ProductModel]()      //产品的推荐产品列表
    var  productCommentNums = ""                     //产品的评论数量
    var  productUseTime = ""                         //产品的使用时间
    var  productEndTime = ""                         //产品的截止时间
    var  productUseRule = ""                         //产品的购买须知
    var  productInfosUrl = ""                        //产品的图文详情链接
    var  productUnit = ""                            //产品的单位
    var  productCollectState = ""                    //产品的收藏状态
    var  productCityName = ""                        //产品所属商铺的区县
    var  productCommentState = ""                    //产品评价状态
}
