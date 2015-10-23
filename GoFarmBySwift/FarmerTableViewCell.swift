//
//  FarmerTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/7.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class FarmerTableViewCell: UITableViewCell {

    var iconIamgeView: UIImageView?
    var titleLabel: UILabel?
    var categoryLabel: UILabel?
    var commentLabel: UILabel?
    var startImageView: UIImageView?
    var commentNumbersLabel: UILabel?
    var addressLabel: UILabel?
    var distanceLabel: UILabel?
    var mapButton: UIButton?
    
    var model: StoreModel? {
        didSet{
            reloadDataSource(self.model!)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconIamgeView = UIImageView()
        iconIamgeView!.backgroundColor = UIColor.whiteColor()
        iconIamgeView!.layer.masksToBounds = true
        iconIamgeView!.layer.cornerRadius = 5
        self.addSubview(iconIamgeView!)
        iconIamgeView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(80)
        }
        
        categoryLabel = UILabel()
        categoryLabel!.backgroundColor = UIColor.whiteColor()
        categoryLabel!.textAlignment = .Left
        categoryLabel!.font = UIFont.systemFontOfSize(13)
        self.addSubview(categoryLabel!)
        categoryLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconIamgeView!.snp_top)
            make.right.equalTo(-20)
            make.height.equalTo(20)
            make.width.equalTo(30)
        }
        
        titleLabel = UILabel()
        titleLabel!.backgroundColor = UIColor.whiteColor()
        titleLabel!.font = UIFont.systemFontOfSize(15)
        self.addSubview(titleLabel!)
        titleLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconIamgeView!.snp_top)
            make.left.equalTo(iconIamgeView!.snp_right).offset(20)
            make.height.equalTo(20)
            make.right.equalTo(categoryLabel!.snp_left).offset(-20)
        }
      
        commentLabel = UILabel()
        commentLabel!.backgroundColor = UIColor.whiteColor()
        commentLabel!.text = "评："
        commentLabel!.textColor = UIColor.orangeColor()
        commentLabel!.font = UIFont.systemFontOfSize(10)
        self.addSubview(commentLabel!)
        commentLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel!.snp_bottom).offset(10)
            make.left.equalTo(titleLabel!.snp_left)
            make.height.equalTo(15)
            make.width.equalTo(20)
        }
        
        startImageView = UIImageView()
        startImageView?.backgroundColor = UIColor.redColor()
        self.addSubview(startImageView!)
        startImageView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel!.snp_bottom).offset(5)
            make.left.equalTo(commentLabel!.snp_right)
            make.height.equalTo(20)
            make.width.equalTo(120)
        }
        
        commentNumbersLabel = UILabel()
        commentNumbersLabel!.backgroundColor = UIColor.whiteColor()
        commentNumbersLabel!.textAlignment = .Center
        commentNumbersLabel!.font = UIFont.systemFontOfSize(12)
        commentNumbersLabel!.textColor = UIColor.orangeColor()
        self.addSubview(commentNumbersLabel!)
        commentNumbersLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(startImageView!.snp_top)
            make.centerY.equalTo(startImageView!.snp_centerY)
            make.right.equalTo(categoryLabel!.snp_left)
        }
        
        mapButton = UIButton()
        mapButton!.backgroundColor = UIColor.greenColor()
        mapButton!.setImage(UIImage(named: ""), forState: .Normal)
        mapButton!.addTarget(self, action: "actionMap", forControlEvents: .TouchUpInside)
        self.addSubview(mapButton!)
        mapButton!.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-20)
            make.bottom.equalTo(-10)
            make.height.equalTo(20)
            make.width.equalTo(15)
        }
        
        distanceLabel = UILabel()
        distanceLabel!.backgroundColor = UIColor.whiteColor()
        distanceLabel!.textAlignment = .Right
        distanceLabel!.font = UIFont.systemFontOfSize(14)
        distanceLabel!.textColor = UIColor.lightGrayColor()
        self.addSubview(distanceLabel!)
        distanceLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(mapButton!.snp_top)
            make.height.equalTo(20)
            make.right.equalTo(mapButton!.snp_left).offset(-5)
            make.width.equalTo(50)
        }
        
        addressLabel = UILabel()
        addressLabel!.textColor = UIColor.lightGrayColor()
        addressLabel!.font = UIFont.systemFontOfSize(10)
        addressLabel!.backgroundColor = UIColor.whiteColor()
        addressLabel!.numberOfLines = 2
        self.addSubview(addressLabel!)
        addressLabel!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(startImageView!.snp_bottom).offset(5)
            make.left.equalTo(titleLabel!.snp_left)
            make.right.equalTo(distanceLabel!.snp_left)
        }
    }
    
    //刷新cell数据
    func reloadDataSource(model: StoreModel) {
//        iconIamgeView!.kf_setImageWithURL(NSURL(string: model.iconUrl)!, placeholderImage:UIImage())
//        titleLabel!.text = model.title
//        categoryLabel!.text = model.category
//        commentNumbersLabel!.text = model.commentNumbers + "条评价"
//        addressLabel!.text = "地址：" + model.address
//        distanceLabel!.text = model.distance + "km"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
