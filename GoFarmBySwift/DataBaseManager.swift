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
            let insert = userTabel.insert(userId <- user.userId, userName <- user.userName, userAccount <- user.userAccount)
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
            model.userAccount = user[userAccount]
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
        try! db.run(alice.update(userName <- user.userName, userAccount <- user.userAccount))
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
    
}
