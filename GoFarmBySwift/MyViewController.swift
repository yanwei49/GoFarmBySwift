//
//  MyViewController.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/4.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, AvatorStateViewDelegate, AboutMineTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource {

    var avatorView: AvatorStateView!
    var tableView: UITableView!
    var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        self.title = "我的"
        
        dataSource = ["我的评论", "安全中心", "版本更新", "关于我们", "版本信息"]
        createAvatorView()
        createTableView()
    }
    
    //创建头部视图
    func createAvatorView() {
        let user = UserModel()
        user.portraitUri = "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg"
        user.userAccount = "12334566777"
        user.userName = "颜魏"
        user.userInfos = "这个人很懒，什么也没有留下，你想看的什么资料呢？"
        
        avatorView = AvatorStateView()
        avatorView.delegate = self
        avatorView.loginState = LoginStateTpye.LoginSuccess
        avatorView.userModel = user
        view.addSubview(avatorView)
        avatorView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(64)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(120)
        }
    }
    
    //创建tableView
    func createTableView() {
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView.backgroundColor = UIColor.lightGrayColor()
        tableView.tableFooterView = UIView()
        tableView.registerClass(MyTableViewCell.classForCoder(), forCellReuseIdentifier: "myCell")
        tableView.registerClass(AboutMineTableViewCell.classForCoder(), forCellReuseIdentifier: "aboutMineCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(avatorView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }

    //tableView的代理方法
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return dataSource.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let mineCell = tableView.dequeueReusableCellWithIdentifier("aboutMineCell") as! AboutMineTableViewCell
            mineCell.delegate = self
            
            return mineCell
        }else {
            let myCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! MyTableViewCell
            myCell.title = dataSource[indexPath.row]
            
            return myCell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }else {
            return 60
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 10
        }
    }
    
    //AvatorStateView的代理方法
    func avatorStateViewDidSelectedLogin(button: UIButton) {
        let loginVC = LoginViewController()
        loginVC.hidesBottomBarWhenPushed = true
        self.navigationController?.showViewController(loginVC, sender: nil)
    }
    
    func avatorStateViewDidSelectedRegister(button: UIButton) {
        let registerVC = RegisterViewController()
        registerVC.hidesBottomBarWhenPushed = true
        self.navigationController?.showViewController(registerVC, sender: nil)
    }
    
    func avatorStateViewDidSelectedUserInfos(button: UIButton) {
        let userInfosVC = UserInfosViewController()
        userInfosVC.hidesBottomBarWhenPushed = true
        self.navigationController?.showViewController(userInfosVC, sender: nil)
    }
    
    //AboutMineTableViewCell的代理方法
    func aboutMineTableViewCellDidSelected(index: NSInteger) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
