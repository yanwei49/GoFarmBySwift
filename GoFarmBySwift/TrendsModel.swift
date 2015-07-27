//
//  TrensModel.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/7.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import Foundation

class TrendsModel: NSObject {
    
    var trendsUser: UserModel = UserModel()    //发动态的用户
    var sendTime: String = ""                  //发送时间
    var sendContent: String = ""               //发送内容
    var imageArray: NSArray = [String]()       //发送的图片数组
    var inspectNums: Int = 0                   //浏览的次数
    var supportNums: Int = 0                   //赞的次数
    var commentArray: NSArray = []             //评论模型
    
}
