//
//  TrensModel.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/7.
//  Copyright © 2015年 &#39068 = ""&#39759 = "". All rights reserved.
//

import Foundation

class TrendsModel: NSObject {
    
    var trendsUser = UserModel()                   //发动态的用户
    var trendsId = ""                              //动态id
    var trendsSendTime = ""                        //发送时间
    var trendsSendContent = ""                     //发送内容
    var trendsImageArray = [String]()              //发送的图片数组
    var trendsSupportNums = ""                     //点赞数
    var trendsIsSupport = false                    //是否点赞
    var trendsCommentArray: [CommentModel] = []    //评论列表
    
}
