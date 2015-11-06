//
//  TrendsViewController.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/4.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class TrendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TrendsTableViewCellDelegate {

    var tableView: UITableView!
    var dataSource: [TrendsModel] = []
    var seg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        self.title = "动态"
        
        let rightBarItem = UIBarButtonItem(title: "写说说", style: UIBarButtonItemStyle.Done, target: self, action: "actionRightItem")
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        obtainDataSource()
        createSeg()
        createtableView()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView!.reloadData()
    }
    
    //右导航按钮事件
    func actionRightItem() {
        let writeTrendsVC = WritetrendsViewController()
        writeTrendsVC.hidesBottomBarWhenPushed = true
        self.navigationController?.showViewController(writeTrendsVC, sender: nil)
    }
    
    //创建seg
    func createSeg() {
        seg = UISegmentedControl(items: ["附近", "好友"])
        seg.selectedSegmentIndex = 0
        seg.tintColor = UIColor.purpleColor()
        seg.addTarget(self, action: "actionValueChange", forControlEvents: .TouchUpInside)
        view.addSubview(seg)
        seg.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(64)
            make.left.equalTo(0)
            make.height.equalTo(30)
            make.right.equalTo(0)
        }
    }
    
    //创建tableView
    func createtableView() {
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.separatorStyle = .None
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.registerClass(TrendsTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(seg!.snp_bottom)
            make.left.equalTo(0)
            make.bottom.equalTo(-49)
            make.right.equalTo(0)
        }
    }
    
    //获取数据源
    func obtainDataSource() {
        for i in 0 ..< 2 {
            let model = TrendsModel()
            let user = UserModel()
            user.portraitUri = "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg"
            user.userName = "yanwei"
            model.trendsId = "\(i)"
            model.trendsUser = user
            model.trendsImageArray = ["https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg", "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
                "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
                "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
                "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg"]
            model.trendsSendTime = "2015-07-05"
            model.trendsSendContent = "z这个地方还不错，值得一去"
            let comment = CommentModel()
            comment.commentContent = "值得一游"
            comment.commentUser = user
            comment.commentTime = "2015-07-05"
            comment.commentRelationId = model.trendsId
            model.trendsCommentArray = [comment]
            
            dataSource.append(model)
        }
    }
    
    //seg的点击方法
    func actionValueChange() {
        if seg!.selectedSegmentIndex == 0 {
        
        }else {
        
        }
        tableView!.reloadData()
    }
    
    //tableView代理方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TrendsTableViewCell
//        cell.delegate = self
        cell.model = dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TrendsTableViewCell.cellForHeightWithTrendModel(dataSource[indexPath.row], type: .TrendsListType)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let trendsDetailVC = TrendsDetailViewController()
        trendsDetailVC.hidesBottomBarWhenPushed = true
        trendsDetailVC.model = dataSource[indexPath.row] as TrendsModel
        self.navigationController!.showViewController(trendsDetailVC, sender: nil)
    }
    
    //TrendsTableViewCell的代理方法
    func trendsTableViewCell(cell: TrendsTableViewCell, selectedItem item: NSInteger) {
        if item < cell.model!.trendsImageArray.count {
            print("选中了第\(item)个Item", terminator: "")
        }else {
            let trendsDetailVC = TrendsDetailViewController()
            trendsDetailVC.hidesBottomBarWhenPushed = true
            trendsDetailVC.model = cell.model!
            self.navigationController!.showViewController(trendsDetailVC, sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
