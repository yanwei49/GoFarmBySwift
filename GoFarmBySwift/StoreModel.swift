//
//  StoreModel.swift
//  GoFarmBySwift
//
//  Created by David Yu on 23/10/15.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import Foundation

class StoreModel: NSObject {
    
    var storeId = ""                              //商铺的ID
    var storeName = ""                            //商铺的名称
    var storeStars = ""                           //商铺的星级
    var toreRelateType = ""                       //商铺的关系类型(1、推荐 2、合作 3、认证  4、邀请)
    var storeAddress = ""                         //商铺的地址
    var storeTel = ""                             //商铺的电话
    var storeType = ""                            //商铺的类型
    var storeCommentCount = ""                    //商铺的评论数量
    var toreQty = ""                              //商铺的总销售
    var storeEnterDate = ""                       //商铺的入驻日期
    var storeState = ""                           //商铺的入住状态（3：未入住，1：入住，2：销户）
    var storeCollectState = ""                    //商铺的收藏状态
    var storeLatitude = ""                        //商铺的纬度
    var storeLongitude = ""                       //商铺的经度
    var storeDistance = ""                        //商铺的位置距离(与用户当前的位置)
    var storeImagesArray = [String]()             //商铺的图片列表
    var storeProductsArray = [ProductModel]()     //商铺的产品列表
    var storeCommentsArray = [CommentModel]()     //商铺的评论列表
    var storeTagsArray = [String]()               //商铺的标签列表
}
