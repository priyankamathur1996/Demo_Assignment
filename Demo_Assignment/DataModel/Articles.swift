//
//  Articles.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on December 14, 2020
//
import Foundation
import SwiftyJSON

struct Articles {

	let source: Source?
	let author: Any?
	let title: String?
	let description: String?
	let url: String?
	let urlToImage: String?
	let publishedAt: String?
	let content: String?

	init(_ json: JSON) {
		source = Source(json["source"])
		author = json["author"]
		title = json["title"].stringValue
		description = json["description"].stringValue
		url = json["url"].stringValue
		urlToImage = json["urlToImage"].stringValue
		publishedAt = json["publishedAt"].stringValue
		content = json["content"].stringValue
	}

}