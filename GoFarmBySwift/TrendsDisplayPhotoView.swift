//
//  TrendsDisplayPhotoView.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/8.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

protocol TrendsDisplayPhotoViewDelegate {
    //collectionView选中某一个Item的回调代理
    func trendsDisplayPhotoView(view: TrendsDisplayPhotoView, didSeletecdItem item: NSInteger)
}

class TrendsDisplayPhotoView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {

    var delegate: TrendsDisplayPhotoViewDelegate?
    var  collectionView: UICollectionView?
    var  dataSource: NSArray = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSizeMake((UIScreen.mainScreen().bounds.width-20-10)/3, (UIScreen.mainScreen().bounds.width-20-10)/3)
        
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView!.backgroundColor = UIColor.whiteColor()
        collectionView!.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        collectionView!.delegate = self
        collectionView!.dataSource = self
        self.addSubview(collectionView!)
        collectionView!.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //collectionView的代理方法
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count/3*3+3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        let imageView = UIImageView(frame: cell.bounds)
        imageView.backgroundColor = UIColor.greenColor()
        if  indexPath.item < dataSource.count {
            let string = dataSource[indexPath.row] as! String
            let url = NSURL(string: string)
            imageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: ""))
        }
        cell.backgroundView = imageView
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            delegate?.trendsDisplayPhotoView(self, didSeletecdItem: indexPath.item)
    }
    
}
