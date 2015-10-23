//
//  CategoryViewController.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/10.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var category: String?                   //类型
    var tableView: UITableView?             //
    var dataSource: NSMutableArray = []     //数据源
    var headView: UIView?                   //滚动视图的父视图
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = category
        
        createNavItem()
        createTableView()
        createTableHeadView()
        obtainDataSource()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView?.reloadData()
    }
    
    //获取数据源
    func obtainDataSource() {
        for _ in 0 ..< 5 {
            let model = StoreModel()
//            model.farmImageUrl = "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg"
//            model.farmTitle = "休闲胜地"
//            model.farmAddress = "景秀江南"
//            model.farmCategory = "度假村"
//            model.farmLocation = "102.222, 33.213"
//            model.farmDistence = "1000m"
//            model.farmStart = 3.5
//            model.farmPriceDetail = "农家饭十人餐 仅售120元"
            dataSource.addObject(model)
        }
        tableView!.reloadData()
    }
    
    //创建导航相关
    func createNavItem() {
        let leftBarItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "actionLeftItem")
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        let rightSearchItem = UIBarButtonItem(title: "搜索", style: .Plain, target: self, action: "actionSearch")
        let rightMapLocationItem = UIBarButtonItem(title: "地图", style: .Plain, target: self, action: "actionMapLocation")
        self.navigationItem.rightBarButtonItems = [rightSearchItem, rightMapLocationItem]
    }
    
    func createTableHeadView() {
        let array = ["https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg", "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg"]
        headView = UIView(frame: CGRectMake(0, 0, view.bounds.width, 150))
        headView!.backgroundColor = UIColor.whiteColor()
        let scrollImage = RepeatRollView()
        scrollImage.initSubViews(.ShowImageType, dataSource: array, direction: .LeftOrRightType)
        headView!.addSubview(scrollImage)
        scrollImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(150)
        }
    }
    
    //创建tableView
    func createTableView() {
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.separatorStyle = .None
        tableView!.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView!.backgroundColor = UIColor.whiteColor()
        tableView!.tableHeaderView = headView
        tableView!.tableFooterView = UIView()
        self.view.addSubview(tableView!)
        tableView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }
    }
    
    //点击事件
    func actionLeftItem() {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    func actionSearch() {
    
    }
    
    func actionMapLocation() {
    
    }
    
    //CategorySiftView的代理方法
    func categorySiftViewOnCilckButton(index: NSInteger) {
        print("点击了第\(index)个按钮", terminator: "")
    }
    
    //tableView的代理方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let spotDetailVC = SpotDetailViewController()
        self.navigationController!.showViewController(spotDetailVC, sender: nil)
    }
    
}
