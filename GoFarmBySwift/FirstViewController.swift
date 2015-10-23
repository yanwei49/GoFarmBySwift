//
//  FirstViewController.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/4.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController  {

    var tableView: UITableView!
    var tableHeader: UIView!
    var categoryView: UIView!
    var dataSource: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let database = DataBaseManager.shareInstance
//        var users = [UserModel]()
//        for i in 0..<2 {
//            let user = UserModel()
//            user.userId = "1"+"\(i)"
//            user.userAccount = "888"+"\(i)"
//            user.userName = "yanwei"+"\(i)"
//            users.append(user)
//        }
////        database.insertUser(users)
//        database.getUserList()
//        
//        let user = UserModel()
//        user.userId = "10"
//        user.userAccount = "2880"
//        user.userName = "neimei0"
//
//        database.selectUserTable(user)
//        
//        database.getUserList()

        view.backgroundColor = UIColor.whiteColor()
        self.title = "首页"
        
        createTableHeader()
        createTableView()
        obtainDataSource()
    }
    
    //创建tableView的头部视图
    func createTableHeader() {
        let array = ["https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg", "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg"]
        let titleArray = ["钓鱼岛是中国的，是不容侵犯的领土", "钓鱼岛是中国的，是不容侵犯的领土", "钓鱼岛是中国的，是不容侵犯的领土", "钓鱼岛是中国的，是不容侵犯的领土", "钓鱼岛是中国的，是不容侵犯的领土"]
        tableHeader = UIView(frame: CGRectMake(0, 0, view.bounds.width, 360))
        tableHeader.backgroundColor = UIColor.lightGrayColor()
        let scrollImage = RepeatRollView()
        scrollImage.initSubViews(.ShowImageType, dataSource: array, direction: .LeftOrRightType)
        tableHeader!.addSubview(scrollImage)
        scrollImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(150)
        }
        
        categoryView = UIView()
        categoryView.backgroundColor = UIColor.greenColor()
        tableHeader!.addSubview(categoryView!)
        categoryView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(scrollImage.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(160)
        }

        let scrollTitle = RepeatRollView()
        scrollTitle.initSubViews(.ShowTitleType, dataSource: titleArray, direction: .DownOrUpType)
        tableHeader!.addSubview(scrollTitle)
        scrollTitle.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(categoryView!.snp_bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(30)
        }
    }
    
    //创建tableView
    func createTableView() {
        tableView = UITableView(frame: CGRectZero, style: .Grouped)
        tableView!.backgroundColor = UIColor.whiteColor()
        tableView.separatorStyle = .None
        tableView.registerClass(HotProductTableViewCell.classForCoder(), forCellReuseIdentifier: "hotProductCell")
        tableView!.tableHeaderView = tableHeader
        tableView!.tableFooterView = UIView()
        tableView!.delegate = self
        tableView!.dataSource = self
        view.addSubview(tableView!)
        tableView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }
    }
    
    //获取数据源
    func obtainDataSource() {
        for _ in 0 ..< 9 {
            let model = ProductModel()
            model.productIconImages = ["https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg"]
            model.productName = "农家土鸡"
            model.productOriginalPrice = "150"
            model.productCurrentPrice = "100"
            dataSource.append(model)
        }
        tableView.reloadData()
    }
    
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0, 1:
                return 1
            default:
                return dataSource.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("hotProductCell") as! HotProductTableViewCell
//                if cell == nil {
//                    cell = HotProductTableViewCell(style: .Default, reuseIdentifier: "hotProductCell")
//                }
                cell.dataSource = dataSource
                
                return cell
            case 1:
                var cell = tableView.dequeueReusableCellWithIdentifier("hotStoreCell")
                if cell == nil {
                    cell = UITableViewCell(style: .Default, reuseIdentifier: "hotStoreCell")
                }
                cell?.backgroundColor = UIColor.greenColor()
                
                return cell!
            default:
                var cell = tableView.dequeueReusableCellWithIdentifier("nearbyProductCell")
                if cell == nil {
                    cell = UITableViewCell(style: .Default, reuseIdentifier: "nearbyProductCell")
                }
                cell?.backgroundColor = UIColor.redColor()

                return cell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
            case 0, 1:
                return 420
            default:
                return 100
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView(frame: CGRectMake(0, 0, view.bounds.width, 40))
        headView.backgroundColor = UIColor.lightGrayColor()
        let v = UIView()
        v.backgroundColor = UIColor.whiteColor()
        headView.addSubview(v)
        v.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.left.right.bottom.equalTo(0)
        }
        
        return headView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
}

