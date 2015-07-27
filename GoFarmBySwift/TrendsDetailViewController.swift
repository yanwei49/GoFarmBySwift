//
//  TrendsDetailViewController.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/7.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class TrendsDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TrendsTableViewCellDelegate {
    
    var tableView: UITableView?
    var model: TrendsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }
    
    
    //创建tableView
    func createTableView() {
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView!.tableFooterView = UIView()
        tableView!.backgroundColor = UIColor.whiteColor()
        tableView!.registerClass(TrendsTableViewCell.classForCoder(), forCellReuseIdentifier: "trendCell")
        tableView!.registerClass(CommentTableViewCell.classForCoder(), forCellReuseIdentifier: "commentCell")
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
    
    //tableView代理方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + model!.commentArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let trendCell = tableView.dequeueReusableCellWithIdentifier("trendCell") as! TrendsTableViewCell
            trendCell.delegate = self
            trendCell.type = .TrendsDetailType
            trendCell.model = model!
//            trendCell.reloadCellDataSource(model!)

            return trendCell
        }else {
            let commentCell = tableView.dequeueReusableCellWithIdentifier("commentCell") as! CommentTableViewCell
            commentCell.reloadDataForCell(model!.commentArray[indexPath.row-1] as! CommentModel)
            
            return commentCell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return TrendsTableViewCell.cellForHeightWithTrendModel(model!, type: .TrendsDetailType)
        }else {
            return CommentTableViewCell.cellForHeight(model!.commentArray[indexPath.row-1] as! CommentModel)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row != 0 {
            
        }
    }
    
    //TrendsTableViewCell的代理方法
    func trendsTableViewCell(cell: TrendsTableViewCell, selectedItem item: NSInteger) {
        if item < cell.model!.imageArray.count {
            print("选中了第\(item)个Item")
        }
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
}


