//
//  AppUrl.swift
//  E-RX
//
//  Created by SinhaAirBook on 29/06/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

struct Domain {
    
    static let development = ""
    static let production = ""

}

extension Domain {
    
    static func baseUrl() -> String {
        return Domain.production
    }
   
}

struct APIEndpoint {

    
}


enum HTTPHeaderField: String {
    
    case authentication  = "Authorization"
    case contentType     = "Content-Type"
    case acceptType      = "Accept"
    case acceptEncoding  = "Accept-Encoding"
    case acceptLangauge  = "Accept-Language"
    
    var header:String{
        
        switch self {
        case .authentication:
            return "Authorization"
        case .contentType:
            return "Content-Type"
        case .acceptType:
            return "Accept"
        case .acceptEncoding:
            return "Accept-Encoding"
        case .acceptLangauge:
            return "Accept-Language"
        
        }
        
    }
    
}

enum ContentType: String {
    case json            = "application/json"
    case multipart       = "multipart/form-data"
    case ENUS            = "en-us"
}

enum MultipartType: String {
    case image = "Image"
    case csv = "CSV"
}

enum MimeType: String {
    case image = "image/png"
    case csvText = "text/csv"
}

enum UploadType: String {
    case avatar
    case file
}



