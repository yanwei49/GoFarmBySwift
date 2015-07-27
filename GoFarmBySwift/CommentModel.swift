//
//  CommentModel.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/8.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import Foundation

class CommentModel {
    
    var  commentContent: String = ""             //评论的内容
    var  commentTime: String = ""                //评论的时间
    var  commentUser: UserModel = UserModel()    //评论者
    var  beCommentUser: UserModel = UserModel()  //被评论者
    
}