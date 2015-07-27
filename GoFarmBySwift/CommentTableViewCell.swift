//
//  CommentTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/8.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    var avatorImageView: UIImageView?
    var nickNameLabel: UILabel?
    var commentTime: UILabel?
    var commentContent: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        avatorImageView = UIImageView()
        avatorImageView!.backgroundColor = UIColor.greenColor()
        avatorImageView!.layer.masksToBounds = true
        avatorImageView!.layer.cornerRadius = 20
        self.addSubview(avatorImageView!)
        avatorImageView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.height.width.equalTo(40)
        }
        
        nickNameLabel = UILabel()
        nickNameLabel!.backgroundColor = UIColor.whiteColor()
        nickNameLabel!.font = UIFont.systemFontOfSize(15)
        self.addSubview(nickNameLabel!)
        nickNameLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(avatorImageView!.snp_top)
            make.left.equalTo(avatorImageView!.snp_right).offset(10)
            make.height.equalTo(20)
            make.right.equalTo(-10)
        }
        
        commentTime = UILabel()
        commentTime!.backgroundColor = UIColor.whiteColor()
        commentTime!.textColor = UIColor.lightGrayColor()
        commentTime!.font = UIFont.systemFontOfSize(12)
        self.addSubview(commentTime!)
        commentTime!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nickNameLabel!.snp_bottom)
            make.bottom.equalTo(avatorImageView!.snp_bottom)
            make.left.equalTo(nickNameLabel!.snp_left)
            make.right.equalTo(-10)
        }
        
        commentContent = UILabel()
        commentContent!.font = UIFont.systemFontOfSize(13)
        commentContent!.backgroundColor = UIColor.whiteColor()
        self.addSubview(commentContent!)
        commentContent!.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(commentTime!.snp_left)
            make.top.equalTo(avatorImageView!.snp_bottom).offset(5)
            make.right.equalTo(-10)
        }
    }
    
    //刷新cell上的数据
    func reloadDataForCell(model: CommentModel) {
        avatorImageView!.kf_setImageWithURL(NSURL(string: model.commentUser.portraitUri)!, placeholderImage: UIImage())
        nickNameLabel!.text = model.commentUser.userName
        commentTime!.text = model.commentTime
        commentContent!.text = model.commentContent
        let string: NSString = model.commentContent
        let size = string.boundingRectWithSize(CGSizeMake(commentContent!.bounds.width, 10000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(13)], context: nil).size
        commentContent!.snp_updateConstraints { (make) -> Void in
            make.height.equalTo(size.height)
        }
    }

    //根据model计算出cell的高度
    class func cellForHeight(model: CommentModel) -> CGFloat {
        var totalHeight: CGFloat = 60.0
        let string: NSString = model.commentContent
        let size = string.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width-70, 10000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(13)], context: nil).size
        totalHeight += size.height
        
        return totalHeight
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
