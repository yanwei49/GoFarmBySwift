//
//  Define.swift
//  GoFarmBySwift
//
//  Created by 颜魏 on 15/10/24.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit

public let Device_Width = UIScreen.mainScreen().bounds.width
public let Device_Height = UIScreen.mainScreen().bounds.height
    
public let CITYNAME_HEADER = "cityName"                                           //城市
public let CITYCODE_HEADER = "cityCode"                                           //城市编码
public let LATITUDE_HEADER = "latitude"                                           //纬度
public let LONGITUDE_HEADER = "longitude"                                         //经度
public let TK_HEADER = "deviceToken"                                              //手机token
public let TIME_OUT = 20                                                          //超时时间

public let Register_Method = "LoginAndRegister/leaguerRegister?json"              //注册
public let Login_Method = "LoginAndRegister/leaguerLogin?json"                    //登录
public let Reginster_Verification_Method = "LoginAndRegister/getAuthCode?json"    //注册 手机获取验证码
public let City_List_Method = "common/getArea?json"                               //城市列表
public let All_City_Detail = "common/threeStageArea?json"                         //全国城市区域详细

public let Change_Verification_Method = "LoginAndRegister/getAuthCodeUpdate?json" //修改密码 手机获取验证码
public let Change_Password_Method = "LoginAndRegister/updatePassword?json"        //修改密码 type（0-修改密码 1-找回密码）

public let Home_List_Method = "home/getHomeInfo?json"                             //首页
public let Map_Nearby_Store_Method = "Merchant/getNearMerchantList?json"          //地图周边商铺
public let Home_Nearby_Product_Method = "Merchant/getNearProcductList?json"       //附近产品
public let Home_Category_Store_List_Method = "Merchant/getMerchantTypeList?json"  //首页下的分类商铺列表
public let Store_Detail_Method = "Merchant/merchantInfo?json"                     //商铺详情
public let Store_Infos_Error_Method = "Merchant/addMerchantError?json"            //商铺信息报错
public let Product_Detail_Method = "Merchant/prodcutDetail?json"                  //产品详情
public let Commit_Order_Method = "Order/addOrder?json"                            //提交订单
public let Add_Shopping_Cart_Method = "Shopping/addshoppingTrolley?json"          //加入购物车
public let Collect_Method = "collection/addCollections?json"                      //收藏
public let Share_Method = "common/dynamicDetails?json"                            //分享
public let Search_Method = "Merchant/getSearchMerchantProductList?json"           //首页搜索
public let More_Hot_Product_Method = "Merchant/hotprocductlist?json"              //更多热销产品
public let More_Hot_Store_Method = "Merchant/getMoreHotMerchants?json"            //更多热门商铺
public let Friend_List_Method = "dynamic/getFriendlist?json"                      //好友列表
public let Add_Friend_Method = "dynamic/addFriend?json"                           //添加好友
public let Search_User_Method = "leaguer/getSearchUser?json"                      //搜索用户
public let Select_Add_Method = "dynamic/UpdatereversionAddFriend?json"            //选择是否添加好友
public let Friend_Request_List_Method = "dynamic/getAddUserList?json"             //添加好友请求通知
public let Remove_Friend_Method = "dynamic/deleteFriend?json"                     //删除好友
public let AddressBook_Method = "leaguer/getphoneList?json"                       //通讯录
public let Farm_List_Method = "Merchant/getMerchantList?json"                     //商铺列表
public let Cate_List_Method = "Merchant/getAllMerchantTypeList?json"              //商铺类型列表
public let Friend_Trends_List_Method = "dynamic/getFriendTrendsList?json"         //好友动态列表
public let Nearby_Trends_List_Method = "dynamic/getNearbyTrendsList?json"         //附近动态列表
public let Write_Trends_Method = "dynamic/talkAbout?json"                         //发表动态
public let Support_Method = "dynamic/praise?json"                                 //点赞
public let Comment_Trends_Method = "dynamic/addComment?json"                      //评论动态
public let Trends_Detail_Method = "dynamic/getCommentList?json"                   //动态详情
public let Delete_Comment_Method = "comment/deleteComment?json"                   //删除评论
public let Friend_Infos_Method = "dynamic/getFriendInfo?json"                     //好友资料
public let Edit_Infos_Method = "leaguer/getUserInfo?json"                         //获取编辑资料
public let Change_User_Infos_Method = "LoginAndRegister/updateUserInfo?json"      //修改编辑资料
public let Store_Apply_Method = "Merchant/storeEnter?json"                        //商铺入住
public let Order_List_Method = "Order/getOrders?json"                             //订单列表
public let Integral_Method = "leaguer/getUserScore?json"                          //我的积分
public let Shopping_Cart_List_Method = "Order/getMyShoppingTrolley?json"          //我的购物车列表
public let Remove_Shopping_Cart_Method = "Shopping/delshoppingTrolley?json"       //删除我的购物车
public let Collect_Store_List_Method = "collection/storeCollections?json"         //我收藏的商铺列表
public let Remove_Collect_List_Method = "collection/delCollections?json"          //删除我的收藏
public let Collect_Product_List_Method = "collection/productCollections?json"     //我收藏的产品列表
public let Comment_List_Method = "comment/getMyComments?json"                     //我的评价列表
public let Feedback_Method = "common/addOnlineFeedback?json"                      //在线反馈
public let Apply_DraBack_Method = "Order/updateRefundInfo?json"                   //申请退款
public let Product_Infos_Detail_Method = "common/graphicDetails?json"             //产品图文详情
public let Order_Detail_Method = "Order/getOrderInfo?json"                        //订单详情
public let Product_Comment_Method = "Product/addProductComment?json"              //产品评价
public let User_Trends_List_Method = "dynamic/getMyTrendsList?json"               //个人动态
public let Store_Rechange_Method = "Merchant/SaveScoreOrderNum?json"              //商铺充值
public let Store_Rechange_State_Method = "Merchant/getScoreHidden?json"           //商铺充值状态
