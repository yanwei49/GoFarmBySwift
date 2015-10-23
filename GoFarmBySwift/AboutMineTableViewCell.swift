



//
//  AboutMineTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/14.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

protocol AboutMineTableViewCellDelegate {
    func aboutMineTableViewCellDidSelected(index: NSInteger)
}

class AboutMineTableViewCell: UITableViewCell {
    
    var delegate: AboutMineTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.whiteColor()
        let array = ["我的订单", "我的积分", "我的收藏", "我的购物车"]
        for i in 0 ..< array.count {
            let button = UIButton()
            button.backgroundColor = UIColor.whiteColor()
            button.tag = 100+i
            button.addTarget(self, action: "actionOnClick:", forControlEvents: .TouchUpInside)
            self.addSubview(button)
            button.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(0)
                make.left.equalTo(UIScreen.mainScreen().bounds.width/4*CGFloat(i))
                make.bottom.equalTo(0)
                make.width.equalTo(UIScreen.mainScreen().bounds.width/4)
            }
            
            let image = UIImageView()
            image.backgroundColor = UIColor.whiteColor()
            image.kf_setImageWithURL(NSURL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg")!)
            button.addSubview(image)
            image.snp_makeConstraints{ (make) -> Void in
                make.right.equalTo(button.snp_centerX).offset(-5)
                make.centerY.equalTo(button.snp_centerY)
                make.height.width.equalTo(30)
            }
            
            let label = UILabel()
            label.backgroundColor = UIColor.whiteColor()
            label.font = UIFont.systemFontOfSize(12)
            label.text = array[i]
            label.numberOfLines = 2
            button.addSubview(label)
            label.snp_makeConstraints{ (make) -> Void in
                make.left.equalTo(button.snp_centerX)
                make.centerY.equalTo(button.snp_centerY)
                make.width.equalTo(40)
            }
            
            let lineView = UIView()
            lineView.backgroundColor = UIColor.lightGrayColor()
            button.addSubview(lineView)
            lineView.snp_makeConstraints{ (make) -> Void in
                make.top.equalTo(5)
                make.bottom.equalTo(-5)
                make.right.equalTo(button.snp_right)
                make.width.equalTo(0.5)
            }
        }
        
    }
    
    func actionOnClick(button: UIButton) {
        delegate?.aboutMineTableViewCellDidSelected(button.tag-100)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
