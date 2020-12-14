//
//  RootArticle.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on December 14, 2020
//
import Foundation
import SwiftyJSON

struct RootArticle {

	let status: String?
	let totalResults: Int?
	let articles: [Articles]?

	init(_ json: JSON) {
		status = json["status"].stringValue
		totalResults = json["totalResults"].intValue
		articles = json["articles"].arrayValue.map { Articles($0) }
	}

}