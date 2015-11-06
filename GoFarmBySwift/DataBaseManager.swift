//
//  DataBaseManager.swift
//  GoFarmBySwift
//
//  Created by David Yu on 23/10/15.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import Foundation
import SQLite

private let dataBase = DataBaseManager()
class DataBaseManager: NSObject {
    var db:Connection!
    override init() {
        super.init()
        //创建数据库
        db = try! Connection(NSHomeDirectory()+"/Documents/goFarm.db")
        print(NSHomeDirectory()+"/Documents/goFarm.db")
        createUserTable()
        createHotProductTable()
    }

    //单例对象
    static var shareInstance: DataBaseManager {
        return dataBase
    }
    
    /*------用户表所需字段------*/
    let userTabel = Table("userTable")
    let id = Expression<Int64>("id")
    let userId = Expression<String>("userId")
    let userName = Expression<String>("userName")
    let userAccount = Expression<String>("userAccount")
    
    /*-----首页热销产品表存储字段-----*/
    let hotProductTable = Table("hotProductTable")                                     //热销产品表名
    let hotProductIdColumn = Expression<String>("hotProductId")                         //热销产品id
    let hotProductNameColumn = Expression<String>("hotProductName")                    //热销产品名称
    let hotProductIconColumn = Expression<String>("hotProductIcon")                    //热销产品图片
    let hotProductOriginalPriceColumn = Expression<String>("hotProductOriginalPrice")  //热销产品原价
    let hotProductCurrentPriceColumn = Expression<String>("hotProductCurrentPrice")    //热销产品现价

    
    //创建用户表单
    func createUserTable() {
        try! db.run(userTabel.create(temporary: false, ifNotExists: true, block: { (t) -> Void in
            t.column(id, primaryKey: true)
            t.column(userAccount)
            t.column(userId)
            t.column(userName)
        }))
    }
    
    //向用户表插入数据
    func insertUser(users: [UserModel]) {
        for user in users {
            let insert = userTabel.insert(userId <- user.userId, userName <- user.userName, userAccount <- user.account)
            //插入数据，返回插入数据在表中的行号（从1开始）
            let rowId = try! db.run(insert)
            print("======rowId = \(rowId)=====")
        }
    }
    
    //获取用户表里面的所有数据
    func getUserList() {
        var array = [UserModel]()
        for user in db.prepare(userTabel) {
            let model = UserModel()
            model.userId = user[userId]
            model.account = user[userAccount]
            model.userName = user[userName]
            
            array.append(model)
            print("userId: \(user[userId]), userName: \(user[userName]), userAccount: \(user[userAccount])")
        }
        print("==\(db.scalar(userTabel.count))===")

    }
    
    //查找用户,更新数据
    func selectUserTable(user: UserModel) {
        //根据条件筛选出要查询的数据
        let alice = userTabel.filter(userId == user.userId)
        try! db.run(alice.update(userName <- user.userName, userAccount <- user.account))
        //局部替换，替换属性中全部的一个字符或字符串
//        try! db.run(alice.update(userName <- userName.replace("i", with: "z")))
        
    }
    
    //删除用户
    func deleteUserTable(user: UserModel) {
        let alice = userTabel.filter(user.userId == userId)
        try! db.run(alice.delete())
        //获取表单数据的条数
        print("==\(db.scalar(userTabel.count))===")
    }
    
    
    
    //创建热销产品表单
    func createHotProductTable() {
        try! db.run(hotProductTable.create(temporary: false, ifNotExists: true, block: { (t) -> Void in
            t.column(id, primaryKey: true)
            t.column(hotProductIdColumn)
            t.column(hotProductNameColumn)
            t.column(hotProductIconColumn)
            t.column(hotProductOriginalPriceColumn)
            t.column(hotProductCurrentPriceColumn)
        }))
    }
    
    //向热销产品表插入数据
    func insertHotProduct(hotProduct: [ProductModel]) {
        for product in hotProduct {
            let insert = hotProductTable.insert(hotProductIdColumn <- product.productId, hotProductNameColumn <- product.productName, hotProductIconColumn <- product.productImages.joinWithSeparator("|"), hotProductOriginalPriceColumn <- product.productOriginalPrice, hotProductCurrentPriceColumn <- product.productCurrentPrice)
            //插入数据，返回插入数据在表中的行号（从1开始）
            let rowId = try! db.run(insert)
        }
    }
    
    //获取热销产品表里面的所有数据
    func getHotProductList() -> [ProductModel] {
        var array = [ProductModel]()
        for product in db.prepare(hotProductTable) {
            let model = ProductModel()
            model.productId = product[hotProductIdColumn]
            model.productName = product[hotProductNameColumn]
            model.productImages = product[hotProductIconColumn].componentsSeparatedByString("|")
            model.productOriginalPrice = product[hotProductOriginalPriceColumn]
            model.productCurrentPrice = product[hotProductCurrentPriceColumn]
            
            array.append(model)
        }

        return array
    }

    //删除用户
    func deleteHotProductTable() {
        try! db.run(hotProductTable.delete())
    }

}
