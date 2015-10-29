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

class TrendsTableViewCell: UITableViewCell {
    
    var delegate: TrendsTableViewCellDelegate?
    
    var  avatorImageView: UIImageView!           //用户头像
    var  userNickName: UILabel!                  //用户昵称
    var  sendTime: UILabel!                     //发送时间
    var  sendContent: UILabel!                   //发送内容
    var  sendImageView: TrendsDisplayPhotoView!  //发送图片展示视图
    var  tabBarView: TabBarView!                 //分享评论赞视图
    var  commentLabel: UILabel!                  //评论
    
    var  model: TrendsModel? {
        didSet {
            reloadCellDataSource(self.model!)
        }
    }
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        
        avatorImageView = UIImageView()
        avatorImageView.backgroundColor = UIColor.whiteColor()
        avatorImageView.layer.masksToBounds = true
        avatorImageView.layer.cornerRadius = 20
        self.contentView.addSubview(avatorImageView)
        avatorImageView.snp_makeConstraints { (make) -> Void in
            make.left.top.equalTo(10)
            make.width.height.equalTo(40)
        }
        
        userNickName = UILabel()
        userNickName.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(userNickName)
        userNickName.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(avatorImageView.snp_right).offset(10)
            make.right.equalTo(-10)
            make.height.equalTo(20)
            make.top.equalTo(avatorImageView.snp_top)
        }
        
        sendTime = UILabel()
        sendTime.backgroundColor = UIColor.whiteColor()
        sendTime.font = UIFont.systemFontOfSize(15)
        sendTime.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(sendTime)
        sendTime.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(avatorImageView.snp_bottom)
            make.left.equalTo(avatorImageView.snp_right).offset(10)
            make.height.equalTo(20)
            make.right.equalTo(-10)
        }
        
        sendContent = UILabel()
        sendContent.numberOfLines = 0
        sendContent.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(sendContent)
        sendContent.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(avatorImageView.snp_bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        sendImageView = TrendsDisplayPhotoView()
        sendImageView.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(sendImageView)
        sendImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(sendContent.snp_bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        tabBarView = TabBarView()
        tabBarView.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(tabBarView)
        tabBarView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(sendImageView.snp_bottom)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(40)
        }
        
        commentLabel = UILabel()
        commentLabel.backgroundColor = UIColor.whiteColor()
        commentLabel.numberOfLines = 0
        commentLabel.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(commentLabel)
        commentLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(tabBarView.snp_bottom)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGrayColor()
        self.contentView.addSubview(lineView)
        lineView.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(0.5)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //刷新cell数据
    func reloadCellDataSource(model: TrendsModel) {
        avatorImageView.kf_setImageWithURL(NSURL(string: model.trendsImageArray.first!)!, placeholderImage: UIImage(named: "accept_btn_hover.png"))
        userNickName.text = model.trendsUser.userName
        sendContent.text = model.trendsSendContent
        sendTime.text = model.trendsSendTime
        sendImageView.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(sendContent.snp_bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(((UIScreen.mainScreen().bounds.width-20-10)/3+5)*2)
        }
        sendImageView.dataSource = model.trendsImageArray
        var commentStr = ""
        for comment in model.trendsCommentArray {
            commentStr += "\(comment.commentUser.userName)：\(comment.commentContent)\n"
        }
        commentStr = NSString(string: commentStr).substringToIndex(commentStr.characters.count-2)
        commentLabel.text = commentStr
    }
    
    //trendsDispplayPhotoView的代理方法
    func trendsDisplayPhotoView(view: TrendsDisplayPhotoView, didSeletecdItem item: NSInteger) {
        delegate?.trendsTableViewCell(self, selectedItem: item)
    }
    
    //根据cell的数据返回cell的高度
    class func cellForHeightWithTrendModel(model: TrendsModel, type: TrendsTableViewCellStyle) -> CGFloat {
        var totalHeight: CGFloat = 50
        if !model.trendsSendContent.isEmpty {
            totalHeight += 5
            //计算评论contentLabel的高度
            let string: NSString = model.trendsSendContent
            let size = string.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width-20, 10000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(17)], context: nil).size
            totalHeight += size.height
        }
        if model.trendsImageArray.count > 0 {
            if model.trendsImageArray.count <= 3 {
                totalHeight += (UIScreen.mainScreen().bounds.width-20-10)/3
                totalHeight += 5
            }else if model.trendsImageArray.count <= 6 {
                totalHeight += (UIScreen.mainScreen().bounds.width-20-10)/3*2+10
                totalHeight += 5
            }else {
                totalHeight += (UIScreen.mainScreen().bounds.width-20-10)/3*3+20
            }
        }
        totalHeight += 40
        
        if type == .TrendsListType {
            //计算评论label的高度
            var commentStr = ""
            for comment in model.trendsCommentArray {
                commentStr += "\(comment.commentUser.userName)：\(comment.commentContent)\n"
            }
            commentStr = NSString(string: commentStr).substringToIndex(commentStr.characters.count-2)
            let size = commentStr.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width-20, 10000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil).size
            totalHeight += size.height
        }
        
        return totalHeight
    }
    
}
