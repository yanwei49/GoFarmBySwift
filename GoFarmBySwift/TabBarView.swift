//
//  TabBarView.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/10.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class TabBarView: UIView {

    var shareButton: UIButton?
    var supprotButton: UIButton?
    var commentButtom: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        shareButton = UIButton()
        shareButton!.setTitle("分享", forState: .Normal)
        shareButton!.layer.borderWidth = 0.5
        shareButton!.layer.borderColor = UIColor.lightGrayColor().CGColor
        shareButton!.layer.masksToBounds = true
        shareButton!.layer.cornerRadius = 8
        shareButton!.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        shareButton!.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        shareButton!.titleLabel?.textColor = UIColor.lightGrayColor()
        shareButton!.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        self.addSubview(shareButton!)
        shareButton!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        
        commentButtom = UIButton()
        commentButtom!.setTitle("评论", forState: .Normal)
        commentButtom!.layer.borderWidth = 0.5
        commentButtom!.layer.borderColor = UIColor.lightGrayColor().CGColor
        commentButtom!.layer.masksToBounds = true
        commentButtom!.layer.cornerRadius = 8
        commentButtom!.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        commentButtom!.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        commentButtom!.titleLabel?.textColor = UIColor.lightGrayColor()
        commentButtom!.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        self.addSubview(commentButtom!)
        commentButtom!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(5)
            make.right.equalTo(-10)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        
        supprotButton = UIButton()
        supprotButton!.setTitle("赞", forState: .Normal)
        supprotButton!.layer.borderWidth = 0.5
        supprotButton!.layer.borderColor = UIColor.lightGrayColor().CGColor
        supprotButton!.layer.masksToBounds = true
        supprotButton!.layer.cornerRadius = 8
        supprotButton!.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        supprotButton!.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        supprotButton!.titleLabel?.textColor = UIColor.lightGrayColor()
        supprotButton!.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        self.addSubview(supprotButton!)
        supprotButton!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(5)
            make.right.equalTo(commentButtom!.snp_left).offset(-10)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
    }

    func action(button: UIButton) {
        if button == shareButton {
        
        }else if button == supprotButton {
        
        }else {
        
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
