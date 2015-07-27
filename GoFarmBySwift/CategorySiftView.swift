//
//  CategorySiftView.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/10.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

protocol CategorySiftViewDelegate {
    func categorySiftViewOnCilckButton(index: NSInteger)
}

class CategorySiftView: UIView {
    
    var categoryButton: UIButton!            //分类按钮
    var areaButton: UIButton!                //区域按钮
    var sequenceButton: UIButton!            //排序按钮
    var delegate: CategorySiftViewDelegate!
    var titleArray: NSArray!
    var imageArray: NSArray!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        categoryButton = UIButton()
        categoryButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        categoryButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        categoryButton.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        categoryButton.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        self.addSubview(categoryButton)
        categoryButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(UIScreen.mainScreen().bounds.width/3)
            make.bottom.equalTo(0)
        }
        
        areaButton = UIButton()
        areaButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        areaButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        areaButton.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        areaButton.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        self.addSubview(areaButton)
        areaButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(UIScreen.mainScreen().bounds.width/3)
            make.width.equalTo(UIScreen.mainScreen().bounds.width/3)
            make.bottom.equalTo(0)
        }

        sequenceButton = UIButton()
        sequenceButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        sequenceButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        sequenceButton.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        sequenceButton.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        self.addSubview(sequenceButton)
        sequenceButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(UIScreen.mainScreen().bounds.width/3*2)
            make.width.equalTo(UIScreen.mainScreen().bounds.width/3)
            make.bottom.equalTo(0)
        }

        for i in 0 ..< 2 {
            let view = UIView()
            view.backgroundColor = UIColor.lightGrayColor()
            self.addSubview(view)
            view.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(0)
                make.left.equalTo(UIScreen.mainScreen().bounds.width/3*CGFloat(i+1))
                make.width.equalTo(0.5)
                make.bottom.equalTo(0)
            }
        }
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(lineView)
        lineView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
            make.bottom.equalTo(0)
        }
    }
    
    func action(button: UIButton) {
        if button == categoryButton {
            delegate?.categorySiftViewOnCilckButton(0)
        }else if button == areaButton {
            delegate?.categorySiftViewOnCilckButton(1)
        }else {
            delegate?.categorySiftViewOnCilckButton(2)
        }
    }
    
    func reloadDataSource(titles: NSArray, images: NSArray) {
        categoryButton.setTitle(titles[0] as? String, forState: .Normal)
        categoryButton.setImage(UIImage(named: images[0] as! String), forState: .Normal)
        areaButton.setTitle(titles[1] as? String, forState: .Normal)
        areaButton.setImage(UIImage(named: images[1] as! String), forState: .Normal)
        sequenceButton.setTitle(titles[2] as? String, forState: .Normal)
        sequenceButton.setImage(UIImage(named: images[2] as! String), forState: .Normal)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
