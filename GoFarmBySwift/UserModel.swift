//
//  UserModel.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/8.
//  Copyright © 2015年 &#39068 = ""&#39759 = "". All rights reserved.
//

import Foundation

class UserModel {
    
    var userName = ""                      //用户昵称
    var userId = ""                        //用户id
    var token = ""                         //用户token
    var isFriend = ""                      //是否是好友关系
    var portraitUri = ""                   //用户头像
    var account = ""                       //用户账号
    var farmNumbers = ""                   //农庄号
    var password = ""                      //用户密码
    var name = ""                          //用户姓名
    var sex = ""                           //用户性别
    var brithday = ""                      //用户生日
    var telephone = ""                     //用户联系方式
    var address = ""                       //用户现居地
    var infos = ""                         //用户简介
    var scoring = ""                       //用户的积分
    var rank = ""                          //用户的等级
    var email = ""                         //用户的邮箱
    var age = ""                           //用户的年龄
    var receiptAddress = ""                //用户的收货地址
    var detailAddress = ""                 //用户的详细地址
    var cneeConsignee = ""                 //用户的收货人姓名
    var consigneeNumbers = ""              //用户的收货人联系方
    var commentsArray = [CommentModel]()   //用户的评论
    var trendsArray = [TrendsModel]()      //用户的动态
    
}