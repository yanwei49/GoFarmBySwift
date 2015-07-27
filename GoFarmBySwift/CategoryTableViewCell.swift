//
//  CategoryTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/10.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var startView: UIView!
    var startLabel: UILabel!
    var categoryLabel: UILabel!
    var addressAndLocationLabel: UILabel!
    var priceDeatilLabel: UILabel!
    var iconImageView: UIImageView!
    
    var model: FarmModel? {
        didSet {
            reloadCellDataSource(self.model!)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.whiteColor()
        
        iconImageView = UIImageView()
        iconImageView.backgroundColor = UIColor.whiteColor()
        self.addSubview(iconImageView)
        iconImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
            make.width.equalTo(100)
        }
        
        titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor.whiteColor()
        self.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.right.equalTo(iconImageView.snp_left).offset(-10)
            make.height.equalTo(20)
        }
        
        startView = UIView()
        startView.backgroundColor = UIColor.greenColor()
        self.addSubview(startView)
        startView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp_bottom).offset(5)
            make.left.equalTo(titleLabel.snp_left)
            make.height.equalTo(20)
            make.width.equalTo(140)
        }
        
        startLabel = UILabel()
        startLabel.backgroundColor = UIColor.whiteColor()
        startLabel.text = "3.5分"
        startLabel.textColor = UIColor.orangeColor()
        startLabel.font = UIFont.systemFontOfSize(13)
        self.addSubview(startLabel)
        startLabel.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(startView.snp_centerY)
            make.top.equalTo(startView.snp_top)
            make.left.equalTo(startView.snp_right).offset(5)
        }
        
        categoryLabel = UILabel()
        categoryLabel.backgroundColor = UIColor.whiteColor()
        categoryLabel.textColor = UIColor.lightGrayColor()
        categoryLabel.font = UIFont.systemFontOfSize(15)
        self.addSubview(categoryLabel)
        categoryLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(startView.snp_left)
            make.top.equalTo(startView.snp_bottom).offset(3)
            make.height.equalTo(20)
            make.width.equalTo(50)
        }
        
        addressAndLocationLabel = UILabel()
        addressAndLocationLabel.textColor = UIColor.lightGrayColor()
        addressAndLocationLabel.font = UIFont.systemFontOfSize(15)
        addressAndLocationLabel.textAlignment = .Right
        addressAndLocationLabel.backgroundColor = UIColor.whiteColor()
        self.addSubview(addressAndLocationLabel)
        addressAndLocationLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(categoryLabel.snp_top)
            make.centerY.equalTo(categoryLabel.snp_centerY)
            make.left.equalTo(categoryLabel.snp_right).offset(10)
            make.right.equalTo(iconImageView.snp_left).offset(-10)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(lineView)
        lineView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(categoryLabel.snp_bottom).offset(5)
            make.left.equalTo(5)
            make.right.equalTo(iconImageView.snp_left).offset(-10)
            make.height.equalTo(0.5)
        }
        
        priceDeatilLabel = UILabel()
        priceDeatilLabel.textColor = UIColor.lightGrayColor()
        priceDeatilLabel.font = UIFont.systemFontOfSize(15)
        priceDeatilLabel.backgroundColor = UIColor.whiteColor()
        self.addSubview(priceDeatilLabel)
        priceDeatilLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(lineView.snp_bottom).offset(2)
            make.left.equalTo(categoryLabel.snp_left)
            make.right.equalTo(-10)
            make.height.equalTo(25)
        }
        
        let view = UIView()
        view.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(view)
        view.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(priceDeatilLabel.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(self.snp_bottom)
        }
    }
    
    //刷新cell数据
    func reloadCellDataSource(model: FarmModel) {
        titleLabel.text = model.farmTitle
        iconImageView.kf_setImageWithURL(NSURL(string: model.farmImageUrl)!, placeholderImage: UIImage())
        categoryLabel.text = model.farmCategory
        startLabel.text = "\(model.farmStart)分"
        addressAndLocationLabel.text = model.farmAddress + model.farmDistence
        priceDeatilLabel.text = model.farmPriceDetail
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
