//
//  MessageViewController.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/4.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class MessageViewController: RCConversationListViewController, RCIMReceiveMessageDelegate {

    var seg: UISegmentedControl?
    var chatListArray: NSMutableArray?
    var friendsArray: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setDisplayConversationTypes([1])
        RCIM.sharedRCIM().receiveMessageDelegate = self
        
        self.conversationListTableView.registerClass(FriendTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        createSeg()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        obtainFriendsDataSource()
    }
    
    //创建seg
    func createSeg() {
        seg = UISegmentedControl(items: ["消息", "好友"])
        seg!.frame = CGRectMake(0, 7, 100, 30)
        seg!.selectedSegmentIndex = 0
        seg!.addTarget(self, action: "actionValueChange", forControlEvents: .ValueChanged)
        self.navigationItem.titleView = seg
    }

    //seg的事件
    func actionValueChange() {
        if seg!.selectedSegmentIndex == 0 {
            self.conversationListDataSource = chatListArray
        }else {
            self.conversationListDataSource = friendsArray
        }
        self.conversationListTableView.reloadData()
    }
    
    //获取好友列表
    func obtainFriendsDataSource() {
        chatListArray = NSMutableArray()
        friendsArray = NSMutableArray()
        for model in self.conversationListDataSource {
            chatListArray!.addObject(model)
        }
        let model = RCConversationModel()
        let rcduserinfo = UserModel()
        rcduserinfo.userName = "yw3"
        rcduserinfo.userId = "yw3"
        rcduserinfo.portraitUri = "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg";
        model.conversationModelType = RCConversationModelType._CONVERSATION_MODEL_TYPE_CUSTOMIZATION
        model.extend = rcduserinfo;
        friendsArray!.addObject(model)
    }
    
    //插入自定义的cell
    override func willReloadTableData(dataSource: NSMutableArray!) -> NSMutableArray! {
        return dataSource
    }
    
    override func rcConversationListTableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        self.conversationListDataSource.removeObjectAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    override func rcConversationListTableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 66.0
    }
    
    override func rcConversationListTableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> RCConversationBaseCell! {
        let model = self.conversationListDataSource[indexPath.row]
        let cell = FriendTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.reloadDataForCell(model as! RCConversationModel)
        
        return cell;
    }
    
    //接受的消息的代理方法
    func onRCIMReceiveMessage(message: RCMessage!, left: Int32) {
        
    }
    
    //点击某个会话的代理方法
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        let chatVC = ChatViewController()
        chatVC.hidesBottomBarWhenPushed = true
        chatVC.targetId = model.targetId
        chatVC.userName = model.conversationTitle;
        chatVC.title = model.conversationTitle;
        chatVC.conversationType = model.conversationType
        self.navigationController?.showViewController(chatVC, sender: nil)
    }
    

}
