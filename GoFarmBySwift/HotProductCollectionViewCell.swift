//
//  HotProductCollectionViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/10/24.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class HotProductCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var nameLable: UILabel!
    var oPriceLable: UILabel!
    var cPriceLable: UILabel!
    var product: ProductModel? {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        imageView = UIImageView()
        imageView.backgroundColor = UIColor.purpleColor()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 3
        contentView.addSubview(imageView)
        imageView.snp_makeConstraints { (make) -> Void in
            make.top.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(85)
        }
        
        nameLable = UILabel()
        nameLable.backgroundColor = UIColor.whiteColor()
        nameLable.font = UIFont.systemFontOfSize(16)
        nameLable.text = "风情荷兰岛"
        nameLable.textAlignment = .Center
        contentView.addSubview(nameLable)
        nameLable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp_bottom).offset(5)
            make.centerX.equalTo(self.snp_centerX)
            make.height.equalTo(20)
        }
        
        cPriceLable = UILabel()
        cPriceLable.backgroundColor = UIColor.whiteColor()
        cPriceLable.font = UIFont.systemFontOfSize(13)
        cPriceLable.textColor = UIColor.orangeColor()
        cPriceLable.textAlignment = .Center
        cPriceLable.text = "￥10"
        contentView.addSubview(cPriceLable)
        cPriceLable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameLable.snp_bottom)
            make.height.equalTo(20)
            make.width.equalTo(Define().width/6)
            make.left.equalTo(0)
        }
        
        oPriceLable = UILabel()
        oPriceLable.backgroundColor = UIColor.whiteColor()
        oPriceLable.font = UIFont.systemFontOfSize(12)
        oPriceLable.textColor = UIColor.lightGrayColor()
        oPriceLable.textAlignment = .Center
        oPriceLable.text = "￥15"
        contentView.addSubview(oPriceLable)
        oPriceLable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameLable.snp_bottom)
            make.height.equalTo(20)
            make.width.equalTo(Define().width/6)
            make.right.equalTo(0)
        }
        
    }

    func reloadData() {
        imageView.kf_setImageWithURL(NSURL(string: (product?.productIconImages.first)!)!, placeholderImage: nil)
        nameLable.text = product?.productName
        cPriceLable.text = "￥\((product?.productCurrentPrice)!)"
        oPriceLable.text = "￥\((product?.productOriginalPrice)!)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
