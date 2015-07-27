//
//  TrendsTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/7.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

enum TrendsTableViewCellStyle {
    case TrendsListType
    case TrendsDetailType
}

protocol TrendsTableViewCellDelegate {
    //选中cell上的collectionview的Item的回调方法
    func trendsTableViewCell(cell: TrendsTableViewCell, selectedItem item: NSInteger)
}

class TrendsTableViewCell: UITableViewCell, TrendsDisplayPhotoViewDelegate {
    
    var delegate: TrendsTableViewCellDelegate?
    
    var  avatorImageView: UIImageView?           //用户头像
    var  userNickName: UILabel?                  //用户昵称
    var  sendTimer: UILabel?                     //发送时间
    var  sendContent: UILabel?                   //发送内容
    var  sendImageView: TrendsDisplayPhotoView?  //发送图片展示视图
    var  tabBarView: TabBarView?                 //分享评论赞视图
    var  inspectImageView: UIImageView?          //浏览图标
    var  inspectLabel: UILabel?                  //浏览数量
    var  supportImageView: UIImageView?          //支持图标
    var  supportLabel: UILabel?                  //支持数量
    var  commentLabel: UILabel?                  //评论数量
    var  type: TrendsTableViewCellStyle?         //cell的类型
    
    var  model: TrendsModel? {
        didSet {
            reloadCellDataSource(self.model!)
        }
//        get {
//            return self.model
//        }
    }
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        avatorImageView = UIImageView()
        avatorImageView!.backgroundColor = UIColor.greenColor()
        avatorImageView!.layer.masksToBounds = true
        avatorImageView!.layer.cornerRadius = 20
        self.addSubview(avatorImageView!)
        avatorImageView!.snp_makeConstraints{ (make) -> Void in
            make.width.height.equalTo(40)
            make.top.equalTo(self.snp_top).offset(10)
            make.left.equalTo(self.snp_top).offset(10)
        }
        
        userNickName = UILabel()
        userNickName!.backgroundColor = UIColor.whiteColor()
        self.addSubview(userNickName!)
        userNickName!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top).offset(10)
            make.left.equalTo(avatorImageView!.snp_right).offset(10)
            make.right.equalTo(self.snp_right).offset(-10)
            make.height.equalTo(20)
        }
        
        sendTimer = UILabel()
        sendTimer!.backgroundColor = UIColor.whiteColor()
        sendTimer!.font = UIFont.systemFontOfSize(14)
        sendTimer!.textColor = UIColor.lightGrayColor()
        self.addSubview(sendTimer!)
        sendTimer!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(userNickName!.snp_bottom)
            make.left.equalTo(userNickName!.snp_left)
            make.right.equalTo(self.snp_right).offset(-10)
            make.height.equalTo(20)
        }
        
        sendContent = UILabel()
        sendContent!.backgroundColor = UIColor.whiteColor()
        self.addSubview(sendContent!)
        sendContent!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(avatorImageView!.snp_bottom).offset(10)
            make.left.equalTo(avatorImageView!.snp_left)
            make.right.equalTo(self.snp_right).offset(-10)
        }
        
        sendImageView = TrendsDisplayPhotoView()
        sendImageView!.backgroundColor = UIColor.whiteColor()
        sendImageView!.delegate = self
        self.addSubview(sendImageView!)
        sendImageView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(sendContent!.snp_bottom).offset(5)
            make.left.equalTo(avatorImageView!.snp_left)
            make.right.equalTo(self.snp_right).offset(-10)
        }
        
        tabBarView = TabBarView()
        tabBarView!.backgroundColor = UIColor.whiteColor()
        self.addSubview(tabBarView!)
        tabBarView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(sendImageView!.snp_bottom).offset(5)
            make.left.equalTo(avatorImageView!.snp_left)
            make.right.equalTo(self.snp_right).offset(-10)
            make.height.equalTo(30)
        }
        
        inspectImageView = UIImageView()
        inspectImageView!.backgroundColor = UIColor.redColor()
        self.addSubview(inspectImageView!)
        inspectImageView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(tabBarView!.snp_bottom).offset(5)
            make.left.equalTo(avatorImageView!.snp_left)
            make.height.width.equalTo(10)
        }
        
        inspectLabel = UILabel()
        inspectLabel!.backgroundColor = UIColor.whiteColor()
        inspectLabel!.font = UIFont.systemFontOfSize(12)
        inspectLabel!.textColor = UIColor.blueColor()
        self.addSubview(inspectLabel!)
        inspectLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(inspectImageView!.snp_top)
            make.left.equalTo(inspectImageView!.snp_right).offset(10)
            make.height.equalTo(10)
            make.right.equalTo(self.snp_right).offset(-10)
        }
        
        supportImageView = UIImageView()
        supportImageView!.backgroundColor = UIColor.greenColor()
        self.addSubview(supportImageView!)
        supportImageView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(inspectImageView!.snp_bottom).offset(5)
            make.left.equalTo(inspectImageView!.snp_left)
            make.height.width.equalTo(10)
        }

        supportLabel = UILabel()
        supportLabel!.backgroundColor = UIColor.whiteColor()
        supportLabel!.textColor = UIColor.blueColor()
        supportLabel!.font = UIFont.systemFontOfSize(12)
        self.addSubview(supportLabel!)
        supportLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(supportImageView!.snp_top)
            make.left.equalTo(supportImageView!.snp_right).offset(10)
            make.height.equalTo(10)
            make.right.equalTo(self.snp_right).offset(-10)
        }
        
        commentLabel = UILabel()
        commentLabel!.backgroundColor = UIColor.whiteColor()
        commentLabel!.font = UIFont.systemFontOfSize(13)
        self.addSubview(commentLabel!)
        commentLabel!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(supportImageView!.snp_bottom).offset(10)
            make.left.equalTo(self.snp_left).offset(10)
            make.right.equalTo(self.snp_right).offset(-10)
            make.bottom.equalTo(-10)
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //刷新cell数据
    func reloadCellDataSource(model: TrendsModel) {
        if type == .TrendsDetailType {
            commentLabel!.removeFromSuperview()
        }
        
        avatorImageView!.kf_setImageWithURL(NSURL(string: model.trendsUser.portraitUri)!, placeholderImage: UIImage(named: ""))
        userNickName!.text = model.trendsUser.userName
        sendTimer!.text = model.sendTime
        inspectLabel!.text = "有\(model.inspectNums)人浏览"
        supportLabel!.text = "有\(model.supportNums)人攒了"
        var string: String = ""
        for i in 0 ..< model.commentArray.count {
            let comment = model.commentArray[i] as! CommentModel
            string += comment.commentUser.userName
            string += ":"
            string += comment.commentContent
            if i != model.commentArray.count - 1 {
                string += "\n"
            }
        }
        commentLabel!.text = string
        sendContent!.text = model.sendContent
        
        if model.sendContent.isEmpty {
            sendImageView!.snp_remakeConstraints { (make) -> Void in
                make.top.equalTo(sendContent!.snp_bottom)
                make.left.equalTo(avatorImageView!.snp_left)
                make.right.equalTo(self.snp_right).offset(-10)
            }
        }else {
            let height = calculateLabelHeight(sendContent!)
            sendContent!.snp_updateConstraints{ (make) -> Void in
                make.height.equalTo(height)
            }
        }
        
        if model.imageArray.count == 0 {
            tabBarView!.snp_remakeConstraints { (make) -> Void in
                make.top.equalTo(sendImageView!.snp_bottom)
                make.left.equalTo(avatorImageView!.snp_left)
                make.right.equalTo(self.snp_right).offset(-10)
            }
        }else {
            let height = (UIScreen.mainScreen().bounds.width-20-10)/3*2+10
            sendImageView!.dataSource = model.imageArray
            sendImageView!.snp_updateConstraints{ (make) -> Void in
                make.height.equalTo(height)
            }
        }
    }
    
    //计算某个label的高度
    func calculateLabelHeight(label: UILabel) -> CGFloat {
        let string: NSString = label.text!
        let size = string.boundingRectWithSize(CGSizeMake(label.bounds.width, 10000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: label.font], context: nil).size

        return size.height
    }
    
    //trendsDispplayPhotoView的代理方法
    func trendsDisplayPhotoView(view: TrendsDisplayPhotoView, didSeletecdItem item: NSInteger) {
        delegate?.trendsTableViewCell(self, selectedItem: item)
    }
    
    //根据cell的数据返回cell的高度
    class func cellForHeightWithTrendModel(model: TrendsModel, type: TrendsTableViewCellStyle) -> CGFloat {
        var totalHeight: CGFloat = 60
        if !model.sendContent.isEmpty {
            totalHeight += 5
            //计算评论contentLabel的高度
            let string: NSString = model.sendContent
            let size = string.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width-20, 10000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(17)], context: nil).size
            totalHeight += size.height
        }
        if model.imageArray.count > 0 {
            if model.imageArray.count <= 3 {
                totalHeight += (UIScreen.mainScreen().bounds.width-20-10)/3
                totalHeight += 5
            }else if model.imageArray.count <= 6 {
                totalHeight += (UIScreen.mainScreen().bounds.width-20-10)/3*2+10
                totalHeight += 5
            }else {
                totalHeight += (UIScreen.mainScreen().bounds.width-20-10)/3*3+20
                totalHeight += 5
            }
        }
        if model.commentArray.count > 0 {
            totalHeight += 10
        }
        totalHeight += 30
        totalHeight += 30
        
        if type == .TrendsListType {
            //计算评论label的高度
            var string: String = ""
            for i in 0 ..< model.commentArray.count {
                let comment = model.commentArray[i] as! CommentModel
                string += comment.commentUser.userName
                string += ":"
                string += comment.commentContent
                if i != model.commentArray.count - 1 {
                    string += "\n"
                }
            }
            let size = string.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width-20, 10000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(13)], context: nil).size
            totalHeight += size.height
        }
        
        return totalHeight
    }
    
}
