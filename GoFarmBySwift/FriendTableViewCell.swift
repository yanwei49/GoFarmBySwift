//
//  FriendTableViewCell.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/8.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

class FriendTableViewCell: RCConversationBaseCell {

    var avatorImageView: UIImageView?
    var nickNameLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        avatorImageView = UIImageView()
        avatorImageView!.backgroundColor = UIColor.whiteColor()
        avatorImageView!.layer.masksToBounds = true
        avatorImageView!.layer.cornerRadius = 20
        self.addSubview(avatorImageView!)
        avatorImageView!.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.width.height.equalTo(40)
            make.centerY.equalTo(self.snp_centerY)
        }
        
        nickNameLabel = UILabel()
        nickNameLabel!.backgroundColor = UIColor.whiteColor()
        self.addSubview(nickNameLabel!)
        nickNameLabel!.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(avatorImageView!.snp_right).offset(20)
            make.right.equalTo(-10)
            make.height.equalTo(30)
            make.centerY.equalTo(self.snp_centerY)
        }
    }

    //刷新cell数据
    func reloadDataForCell(model: RCConversationModel) {
        let user = model.extend as! UserModel
        avatorImageView!.kf_setImageWithURL(NSURL(string: user.portraitUri)!, placeholderImage: UIImage(named: ""))
        nickNameLabel!.text = user.userName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
