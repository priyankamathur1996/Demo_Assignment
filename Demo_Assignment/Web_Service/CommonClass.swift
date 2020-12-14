//
//  CommonClass.swift
//  Notari
//
//  Created by Callsoft on 25/09/17.
//  Copyright © 2017 Callsoft. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration
import CoreLocation

class CommonClass{
    
    static let sharedInstance = CommonClass()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var scrollManagerScreenIsOpen = false
    
    var globalUserID = ""
    
    var locationLatCordinate = Double()
    var locationLongCordinate = Double()
    
    var isUserProfessionalWorker = "false"
    var isUserDeliveryWorker = "false"
    
    var chatScreenIsOpen = false
    
    private init() {}
    

    func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
        
        
    }
    
    func checkRegexForName(name:String)->Bool{
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: name, options: [], range: NSMakeRange(0, name.count)) != nil {
                return false
                
            } else {
                return true
            }
        }
        catch {
            return false
        }
    }
    
    
    
    
    func callNativeAlert(title:String,message:String,controller:UIViewController){
     
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        controller.present(alert, animated: true, completion: nil)
    }
    


}

struct AppColor {
    
    //MARK: - Constant colors
    public static let textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
}
