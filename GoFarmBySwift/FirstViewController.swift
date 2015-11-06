//
//  FirstViewController.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/4.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController  {

    var tableView: UITableView!
    var tableHeader: UIView!
    var categoryView: UIView!
    var products = [ProductModel]()
    let dataBaseManager = DataBaseManager.shareInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        self.title = "首页"
        
        products = dataBaseManager.getHotProductList()
        createTableHeader()
        createTableView()
        
//        requestHome()
    }
    
    func requestHome() {
        var parameters: [String: String]?
        HttpManager.shareInstance.requestHomeData(parameters, successClosure: { (data) -> Void in
                self.products = Parser.shareInstance.dataArrayWithData(data, type: "hotProducts") as! [ProductModel]
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                    self.dataBaseManager.deleteHotProductTable()
                    self.dataBaseManager.insertHotProduct(self.products)
                })
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }, otherErrorClosure: { (data) -> Void in
                print(data)
            }) { (data) -> Void in
                print(data)
        }
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
                return products.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("hotProductCell") as! HotProductTableViewCell
                cell.dataSource = products
                
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
                cell?.textLabel!.text = "第\(indexPath.row)行"

                return cell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return CGFloat(self.products.count/3*140)
            case 1:
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

