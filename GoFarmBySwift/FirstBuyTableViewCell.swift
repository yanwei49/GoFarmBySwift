//
//  FristTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/11.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

protocol FirstBuyTableViewCellDelegate {
    func firstBuyTableViewCell(cell: FirstBuyTableViewCell, buttonIndex index: NSInteger)
}

class FirstBuyTableViewCell: UITableViewCell {

    var iconImageViewArray: NSMutableArray!       //图片载体数组
    var shopLabelArray: NSMutableArray!       //商品Label数组
    var originalLabelArray: NSMutableArray!   //商品原价label数组
    var nowLabelArray: NSMutableArray!        //商品现价label数组
    var delegate: FirstBuyTableViewCellDelegate!
    var dataSource: NSArray? {
        didSet {
            cellReloadDataSource(self.dataSource!)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.whiteColor()
        iconImageViewArray = NSMutableArray()
        shopLabelArray = NSMutableArray()
        originalLabelArray = NSMutableArray()
        nowLabelArray = NSMutableArray()
        
        for i in 0 ..< 4 {
            let backGroundView = UIButton()
            backGroundView.backgroundColor = UIColor.whiteColor()
            backGroundView.tag = 100+i
            backGroundView.addTarget(self, action: "actionOnClick:", forControlEvents: .TouchUpInside)
            self.addSubview(backGroundView)
            backGroundView.snp_makeConstraints{ (make) -> Void in
                make.top.equalTo(0)
                make.left.equalTo(UIScreen.mainScreen().bounds.width/4*CGFloat(i))
                make.width.equalTo(UIScreen.mainScreen().bounds.width/4)
                make.bottom.equalTo(0)
            }
            
            if i == 0 {
                let label = UILabel()
                label.textColor = UIColor.lightGrayColor()
                label.font = UIFont.systemFontOfSize(10)
                label.textAlignment = .Center
                label.text = "2015.07.07"
                label.backgroundColor = UIColor.whiteColor()
                backGroundView.addSubview(label)
                label.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(15)
                    make.left.equalTo(5)
                    make.right.equalTo(-5)
                    make.height.equalTo(20)
                }
                
                let icon = UIImageView()
                icon.backgroundColor = UIColor.greenColor()
                icon.kf_setImageWithURL(NSURL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg")!)
                icon.layer.masksToBounds = true
                icon.layer.cornerRadius = 35
                icon.layer.borderColor = UIColor.lightGrayColor().CGColor
                icon.layer.borderWidth = 0.3
                backGroundView.addSubview(icon)
                icon.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(label.snp_bottom).offset(5)
                    make.bottom.equalTo(-10)
                    make.width.equalTo(70)
                    make.centerX.equalTo(backGroundView.snp_centerX)
                }
            }else {
                let iconImageView = UIImageView()
                iconImageView.backgroundColor = UIColor.whiteColor()
                iconImageView.layer.masksToBounds = true
                iconImageView.layer.cornerRadius = 5
                backGroundView.addSubview(iconImageView)
                iconImageViewArray?.addObject(iconImageView)
                iconImageView.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(15)
                    make.left.equalTo(5)
                    make.right.equalTo(-5)
                    make.height.equalTo(60)
                }
                
                let nameLabel = UILabel()
                nameLabel.backgroundColor = UIColor.whiteColor()
                nameLabel.textAlignment = .Center
                nameLabel.font = UIFont.systemFontOfSize(12)
                backGroundView.addSubview(nameLabel)
                shopLabelArray?.addObject(nameLabel)
                nameLabel.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(iconImageView.snp_bottom).offset(5)
                    make.centerX.equalTo(iconImageView.snp_centerX)
                    make.left.equalTo(iconImageView.snp_left)
                    make.height.equalTo(20)
                }
                
                let nowPriceLabel = UILabel()
                nowPriceLabel.backgroundColor = UIColor.whiteColor()
                nowPriceLabel.font = UIFont.systemFontOfSize(11)
                nowPriceLabel.textAlignment = .Center
                nowPriceLabel.textColor = UIColor.purpleColor()
                backGroundView.addSubview(nowPriceLabel)
                nowLabelArray?.addObject(nowPriceLabel)
                nowPriceLabel.snp_makeConstraints{ (make) -> Void in
                    make.left.equalTo(0)
                    make.top.equalTo(nameLabel.snp_bottom)
                    make.height.equalTo(18)
                }
                
                let originalPriceLabel = UILabel()
                originalPriceLabel.backgroundColor = UIColor.whiteColor()
                originalPriceLabel.font = UIFont.systemFontOfSize(9)
                originalPriceLabel.textAlignment = .Center
                originalPriceLabel.textColor = UIColor.lightGrayColor()
                backGroundView.addSubview(originalPriceLabel)
                originalLabelArray?.addObject(originalPriceLabel)
                originalPriceLabel.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(nameLabel.snp_bottom)
                    make.height.equalTo(18)
                    make.right.equalTo(-5)
                }
            }
        }
        
    }
    
    //刷新cell的数据
    func cellReloadDataSource(array: NSArray) {
        for i in 0 ..< array.count {
            let model = array[i] as! GoodsModel
            let iconImageView = iconImageViewArray[i] as! UIImageView
            let nameLabel = shopLabelArray[i] as! UILabel
            let nowPriceLabel = nowLabelArray[i] as! UILabel
            let originalPriceLabel = originalLabelArray[i] as! UILabel
            iconImageView.kf_setImageWithURL(NSURL(string: model.goodsIconImage!)!)
            nameLabel.text = model.goodsName
            nowPriceLabel.text = "价格"+" \(model.goodsNowPrice!)"
            originalPriceLabel.text = "原价"+"\(model.goodsOriginalPrice!)"
        }
    }
    
    //按钮的点击事件
    func actionOnClick(button: UIButton) {
        delegate?.firstBuyTableViewCell(self, buttonIndex: button.tag-100)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
