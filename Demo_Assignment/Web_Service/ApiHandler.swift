//
//  ApiHandler.swift
//  AIPL ABRO
//
//  Created by CST on 21/01/20.
//  Copyright © 2020 promatics. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit


var commonController = UIViewController()

class  ApiHandler:Requestable{
    
    func fetchApiService(method:Method,url:String,passDict:[String:Any]? = nil,header:[String:String]? = nil, callback: @escaping Handler){
        
        IJProgressView.shared.showProgressView(view: commonController.view)

        guard CommonClass.sharedInstance.isConnectedToNetwork() else {
            CommonClass.sharedInstance.callNativeAlert(title: "", message: "Please check your internet connection", controller: commonController)
            return
        }
        
        request(method: method, url: url, params: passDict, headers: header) {(result) in
            callback(result)
            if url != Domain.baseUrl().appending(url){
                //Indicator.shared.hideProgressView()
                IJProgressView.shared.hideProgressView()
            }
        }
    }
    
    
}

