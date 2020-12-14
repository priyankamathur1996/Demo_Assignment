//
//  ViewModel.swift
//  Joker
//
//  Created by User on 03/12/20.
//  Copyright © 2020 Callsoft. All rights reserved.
//

import Foundation
import UIKit

class ViewModel: NSObject{
    
    let apiHandle = ApiHandler()
    // Closures
    var success = {(message :String) -> () in }
    var errorMessage = {(message : String) -> () in }
    var reloadList = {() -> () in }
    var reloadCollection = {() -> () in}

    
    //News API Data Service
    var rootArticleArr = [RootArticle]()
    func getNewsData(_ strUrl:String,_ params:[String:Any]? = nil,_ header:[String:String]? = nil)
    {
        apiHandle.fetchApiService(method: .get, url: strUrl, passDict: params, header: header) { (result) in
            switch result {
            
            case .success( let data):
                
                if self.rootArticleArr.count > 0 {
                    self.rootArticleArr.removeAll()
                }
                
                print(data)
                
                self.rootArticleArr.append(RootArticle(data))

                if self.rootArticleArr.first?.status == "ok"{
                    
                    self.reloadList()
                    
                }else{
                    self.errorMessage(self.rootArticleArr.first?.status ?? "")
                }
                
                break
                
            case .failure(let error):
                
                self.errorMessage(error.localizedDescription)
                
                break
            }
        }
        
    }
    

}
