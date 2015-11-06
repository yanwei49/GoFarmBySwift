//
//  CommentModel.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/8.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import Foundation

class CommentModel {
    
    var commentContent = ""                  //评论的文字内容
    var commentType = ""                     //评论的类型
    var commentRelationId = ""               //评论关联的另一个Id
    var commentId = ""                       //评论的id
    var commentImagesArray = [String]()      //评论的图片数组
    var commentTime = ""                     //评论的时间
    var commentStar = ""                     //评论的星级
    var beCommentInfos = ""                  //被评论的商铺或产品的信息
    var beCommentId = ""                     //被评论的商铺或产品的Id
    var commentUser = UserModel()            //评论者
    var beCommentUser = UserModel()          //被评论者

}