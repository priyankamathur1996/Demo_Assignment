//
//  Source.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on December 14, 2020
//
import Foundation
import SwiftyJSON

struct Source {

	let id: Any?
	let name: String?

	init(_ json: JSON) {
		id = json["id"]
		name = json["name"].stringValue
	}

}