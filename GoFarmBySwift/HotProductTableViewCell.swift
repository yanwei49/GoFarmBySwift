//
//  HotProductTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/10/24.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class HotProductTableViewCell: UITableViewCell {

    var collectionView: UICollectionView!
    var dataSource: [ProductModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.itemSize = CGSizeMake(Device_Width/3, 140)
        
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout:flowLayout)
        collectionView.registerClass(HotProductCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "item")
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.top.equalTo(0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HotProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! HotProductCollectionViewCell
        cell.product = dataSource![indexPath.item]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
    }
    
}



