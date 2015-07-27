

//
//  MyTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/14.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    private var iconImageView: UIImageView!
    private var titleLabel: UILabel!
    private var detailButton: UIButton!
    
    var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView()
        iconImageView.backgroundColor = UIColor.whiteColor()
        iconImageView.kf_setImageWithURL(NSURL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg")!)
        self.addSubview(iconImageView)
        iconImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.width.height.equalTo(40)
        }
        
        titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor.whiteColor()
        self.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.snp_centerY)
            make.left.equalTo(iconImageView.snp_right).offset(10)
            make.height.equalTo(30)
            make.right.equalTo(-100)
        }
        
        detailButton = UIButton()
        detailButton.backgroundColor = UIColor.greenColor()
        detailButton.setImage(UIImage(named: ""), forState: .Normal)
        self.addSubview(detailButton)
        detailButton.snp_makeConstraints { (make) -> Void in
            make.width.height.equalTo(20)
            make.right.equalTo(-20)
            make.centerY.equalTo(self.snp_centerY)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
