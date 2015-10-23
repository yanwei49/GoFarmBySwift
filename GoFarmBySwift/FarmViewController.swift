//
//  FarmViewController.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/4.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class FarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    var dataSource = [StoreModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        self.title = "庄主"
        
        createTableView()
        obtainDataSource()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView!.reloadData()
    }
    
    //创建tableView
    func createTableView() {
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView!.backgroundColor = UIColor.whiteColor()
        tableView!.tableFooterView = UIView()
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.registerClass(FarmerTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        view.addSubview(tableView!)
        tableView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        tableView!.reloadData()
    }
    
    //获取数据源
    func obtainDataSource() {
        for _ in 0 ..< 8 {
            let model = StoreModel()
//            model.iconUrl = "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg"
//            model.title = "芙蓉漂流"
//            model.commentNumbers = "125"
//            model.address = "广州市花都区山前大道芙蓉嶂旅游渡假区(近桃花园山庄)"
//            model.distance = "25"
//            model.category = "游船"
            dataSource.append(model)
        }
    }
    
    //tableView的代理fangf
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let spotDetailVC = SpotDetailViewController()
        spotDetailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.showViewController(spotDetailVC, sender: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    //CategorySiftView的代理方法
    func categorySiftViewOnCilckButton(index: NSInteger) {
        print("点击了第\(index)个按钮", terminator: "")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
