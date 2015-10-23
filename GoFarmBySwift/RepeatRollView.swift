//
//  RepeatRollView.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/9.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

//scrollview上显示的内容
enum ScrollShowContentType {
    case ShowImageType
    case ShowTitleType
}

//scrollview滚动得方向
enum ScrollDirectionType {
    case DownOrUpType
    case LeftOrRightType
}

class RepeatRollView: UIView, UIScrollViewDelegate {

    var scrollView: UIScrollView!                //滚动得scrollview
    var isShowPage: Bool!                        //是否显示Page
    var dataSourceO: NSArray!                     //数据源
    var directionO: ScrollDirectionType!          //滚动方向
    var timer: NSTimer!                           //定时器
    var page: UIPageControl!
    var currentPage: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        scrollView = UIScrollView()
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.whiteColor()
        self.addSubview(scrollView)
        scrollView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }
        
        page = UIPageControl()
        page.pageIndicatorTintColor = UIColor.lightGrayColor()
        page.currentPageIndicatorTintColor = UIColor.whiteColor()
        self.addSubview(page)
        page.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp_centerX)
            make.height.equalTo(20)
            make.width.equalTo(200)
            make.bottom.equalTo(self.snp_bottom)
        }
    }

    //根据展示的类型和数据源初始化子视图
    func initSubViews(type: ScrollShowContentType, dataSource: NSArray, direction: ScrollDirectionType) {
        dataSourceO = dataSource
        page.numberOfPages = dataSource.count
        page.currentPage = 0
        directionO = direction
        scrollView.backgroundColor = UIColor.whiteColor()
        if type == .ShowImageType {
            scrollView.contentSize = CGSizeMake(
                UIScreen.mainScreen().bounds.width*CGFloat(dataSource.count), CGFloat(150))
                for i in 0 ..< dataSource.count {
                let url = dataSource[i] as! String
                let imageView = UIImageView()
                imageView.backgroundColor = UIColor.whiteColor()
                imageView.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: UIImage(named: ""))
                scrollView.addSubview(imageView)
                imageView.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(0)
                    make.left.equalTo(UIScreen.mainScreen().bounds.width*CGFloat(i))
                    make.height.equalTo(150)
                    make.width.equalTo(UIScreen.mainScreen().bounds.width)
                }
            }
        }else if type == .ShowTitleType {
            page.hidden = true
            scrollView.contentSize = CGSizeMake(scrollView.bounds.width, scrollView.bounds.height*CGFloat(dataSource.count))
            for i in 0 ..< dataSource.count {
                let string = dataSource[i] as! String
                let label = UILabel()
                label.backgroundColor = UIColor.whiteColor()
                label.font = UIFont.systemFontOfSize(15)
                label.text = string
                scrollView.addSubview(label)
                label.snp_makeConstraints{ (make) -> Void in
                    make.top.equalTo(30*CGFloat(i))
                    make.left.equalTo(40)
                    make.height.equalTo(30)
                    make.right.equalTo(0)
                }
            }
            
            for i in 0 ..< 2 {
                let lineView = UIView()
                lineView.backgroundColor = UIColor.lightGrayColor()
                self.addSubview(lineView)
                lineView.snp_makeConstraints{ (make) -> Void in
                    make.left.equalTo(0)
                    make.height.equalTo(0.5)
                    make.right.equalTo(0)
                    make.top.equalTo(29.5*CGFloat(i))
                }
            }
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "run", userInfo: nil, repeats: true)
    }
    
    //定时器方法
    func run() {
        if directionO == .LeftOrRightType {
            scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x + scrollView.bounds.width, scrollView.contentOffset.y), animated: true)
            page.currentPage++
            if page.currentPage == page.numberOfPages-1 {
                page.currentPage = -1
                scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
            }
        }else {
            if scrollView.contentOffset.y >= scrollView.bounds.height*CGFloat(dataSourceO.count-1) {
                scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
            }else if (scrollView.contentOffset.y <= 0) {
                scrollView.setContentOffset(CGPointMake(0, scrollView.bounds.height*CGFloat(dataSourceO.count-1)), animated: true)
            }
            scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y + scrollView.bounds.height), animated: true)
        }
    }
    
    //scrollView的代理方法
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if directionO == .LeftOrRightType {
            page.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
            if currentPage == page.currentPage && currentPage == dataSourceO.count-1 {
                page.currentPage = 0
                scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
            }else if currentPage == page.currentPage && currentPage == 0 {
                page.currentPage = dataSourceO.count-1
                scrollView.setContentOffset(CGPointMake(scrollView.bounds.width*CGFloat(dataSourceO.count-1), 0), animated: false)
            }
            currentPage = page.currentPage
        }else {
            if scrollView.contentOffset.y >= scrollView.bounds.height*CGFloat(dataSourceO.count-1) {
                scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
            }else if (scrollView.contentOffset.y <= 0) {
                scrollView.setContentOffset(CGPointMake(0, scrollView.bounds.height*CGFloat(dataSourceO.count-1)), animated: false)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
