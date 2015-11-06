//
//  HttpManager.swift
//  GoFarmBySwift
//
//  Created by David Yu on 6/11/15.
//  Copyright © 2015年 &#39068;&#39759;. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let manager = HttpManager()
private let kHostURL = "http://www.51qnz.cn/"      // 公司域名
private let deviceToken = UIDevice.currentDevice().identifierForVendor?.UUIDString

class HttpManager: NSObject {
    
    //创建单例
    class var shareInstance: HttpManager {
        get {
            return manager
        }
    }
    
    func settingRequestHead() -> [String: String] {
        var head = [String: String]()
       
        head[CITYNAME_HEADER] = "shenzhenshi"
        head[CITYCODE_HEADER] = "440300"
        head[LATITUDE_HEADER] = "22.321"
        head[LONGITUDE_HEADER] = "113.500"
        head[TK_HEADER] = deviceToken
        
        return head
    }

    //根据状态回调block
    func responseObjectParser(response: Response<AnyObject, NSError>, successClosure: (data: AnyObject) -> Void, otherErrorClosure: (data: AnyObject) -> Void, failureClosure: (data: AnyObject) -> Void) {
        if let data = response.result.value {
            if Int(JSON(data)["code"].stringValue) == 200 {
//                print("成功============")
                successClosure(data: data)
            }else {
                print("失败")
            }
        }
        if let error = response.result.error {
            failureClosure(data: error)
        }

        
    }
    
    
    func requestHomeData(parameters: [String: String]?, successClosure: (data: AnyObject) -> Void, otherErrorClosure: (data: AnyObject) -> Void, failureClosure: (data: AnyObject) -> Void) {
        Alamofire.request(.GET, kHostURL+Home_List_Method, parameters: parameters, encoding: .JSON, headers: settingRequestHead()).responseJSON(options: .MutableContainers) { (response) -> Void in
            
            self.responseObjectParser(response, successClosure: successClosure, otherErrorClosure: otherErrorClosure, failureClosure: failureClosure)
        }
    }
    

}
