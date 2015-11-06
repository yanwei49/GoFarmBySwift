//
//  AvatorStateView.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/7/14.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

enum LoginStateTpye {
    case NotLogin
    case LoginSuccess
}

protocol AvatorStateViewDelegate {
    func avatorStateViewDidSelectedRegister(button: UIButton)
    func avatorStateViewDidSelectedLogin(button: UIButton)
    func avatorStateViewDidSelectedUserInfos(button: UIButton)
}

class AvatorStateView: UIView {

    var loginBackgroundImageView: UIImageView!
    var notLoginBackgroundImageView: UIImageView!
    
    private var avatorImageView: UIImageView!
    private var nickNameLabel: UILabel!
    private var accountLabel: UILabel!
    private var introduceLabel: UILabel!
    private var detailButton: UIButton!
    
    var delegate: AvatorStateViewDelegate?
    
    var user: UserModel! {
        didSet {
            avatorImageView.kf_setImageWithURL(NSURL(string: (user.portraitUri))!, placeholderImage: UIImage(named: ""))
            nickNameLabel.text = user.userName
            accountLabel.text = "农庄号:" + "\(user.account)"
            introduceLabel.text = "个人说明:" + "\(user.infos)"
        }
    }
    //登陆状态
    var loginState: LoginStateTpye? {
        didSet {
            if loginState == .NotLogin {
                createNotLoginView()
//                loginBackgroundImageView.hidden = true
//                notLoginBackgroundImageView.highlighted = false
                
            }else {
                createLoginSuccessView()
//                loginBackgroundImageView.hidden = false
//                notLoginBackgroundImageView.highlighted = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
//        createLoginSuccessView()
//        createNotLoginView()
    }
    
    //创建登陆成功的界面布局
    func createNotLoginView() {
        notLoginBackgroundImageView = UIImageView()
        notLoginBackgroundImageView.backgroundColor = UIColor.whiteColor()
        notLoginBackgroundImageView.userInteractionEnabled = true
        notLoginBackgroundImageView.kf_setImageWithURL(NSURL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg")!, placeholderImage: UIImage(named: ""))
        self.addSubview(notLoginBackgroundImageView)
        notLoginBackgroundImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }
        
        let registerButton = UIButton()
        registerButton.backgroundColor = UIColor.purpleColor()
        registerButton.setTitle("注册", forState: .Normal)
        registerButton.alpha = 0.7
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 5
        registerButton.addTarget(self, action: "actionRegister:", forControlEvents: .TouchUpInside)
        notLoginBackgroundImageView.addSubview(registerButton)
        registerButton.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.snp_centerY)
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.centerX.equalTo(self.snp_centerX).offset(-(UIScreen.mainScreen().bounds.width-160)/3/2-40)
        }
        
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor.purpleColor()
        loginButton.setTitle("登陆", forState: .Normal)
        loginButton.alpha = 0.7
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: "actionLogin:", forControlEvents: .TouchUpInside)
        notLoginBackgroundImageView.addSubview(loginButton)
        loginButton.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.snp_centerY)
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.centerX.equalTo(self.snp_centerX).offset((UIScreen.mainScreen().bounds.width-160)/3/2+40)
        }
    }
    
    //创建登陆成功的界面布局
    func createLoginSuccessView() {
        loginBackgroundImageView = UIImageView()
        loginBackgroundImageView.backgroundColor = UIColor.whiteColor()
        loginBackgroundImageView.userInteractionEnabled = true
        loginBackgroundImageView.kf_setImageWithURL(NSURL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg")!, placeholderImage: UIImage(named: ""))
        self.addSubview(loginBackgroundImageView)
        loginBackgroundImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }

        avatorImageView = UIImageView()
        avatorImageView.backgroundColor = UIColor.clearColor()
        avatorImageView.layer.masksToBounds = true
        avatorImageView.layer.cornerRadius = 30
        loginBackgroundImageView.addSubview(avatorImageView)
        avatorImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }

        detailButton = UIButton()
        detailButton.backgroundColor = UIColor.redColor()
        detailButton.setImage(UIImage(named: ""), forState: .Normal)
        detailButton.addTarget(self, action: "actionDetailInfos:", forControlEvents: .TouchUpInside)
        loginBackgroundImageView.addSubview(detailButton)
        detailButton.snp_makeConstraints { (make) -> Void in
            make.width.height.equalTo(20)
            make.right.equalTo(-20)
            make.centerY.equalTo(loginBackgroundImageView.snp_centerY)
        }
        
        nickNameLabel = UILabel()
        nickNameLabel.backgroundColor = UIColor.clearColor()
        nickNameLabel.textColor = UIColor.whiteColor()
        loginBackgroundImageView.addSubview(nickNameLabel)
        nickNameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(avatorImageView.snp_top)
            make.left.equalTo(avatorImageView.snp_right).offset(10)
            make.height.equalTo(20)
        }
        
        accountLabel = UILabel()
        accountLabel.backgroundColor = UIColor.clearColor()
        accountLabel.font = UIFont.systemFontOfSize(15)
        accountLabel.textColor = UIColor.whiteColor()
        loginBackgroundImageView.addSubview(accountLabel)
        accountLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nickNameLabel.snp_bottom).offset(5)
            make.left.equalTo(nickNameLabel.snp_left)
            make.height.equalTo(15)
            make.right.equalTo(detailButton.snp_left).offset(-20)
        }
        
        introduceLabel = UILabel()
        introduceLabel.backgroundColor = UIColor.clearColor()
        introduceLabel.textColor = UIColor.whiteColor()
        introduceLabel.font = UIFont.systemFontOfSize(13)
        introduceLabel.numberOfLines = 0
        loginBackgroundImageView.addSubview(introduceLabel)
        introduceLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(accountLabel.snp_bottom).offset(5)
            make.left.equalTo(nickNameLabel.snp_left)
            make.right.equalTo(detailButton.snp_left).offset(-20)
        }
    }
    
    //点击事件
    func actionRegister(button: UIButton) {
        delegate?.avatorStateViewDidSelectedRegister(button)
    }
    
    func actionLogin(button: UIButton) {
        delegate?.avatorStateViewDidSelectedLogin(button)
    }

    func actionDetailInfos(button: UIButton) {
        delegate?.avatorStateViewDidSelectedUserInfos(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
}
