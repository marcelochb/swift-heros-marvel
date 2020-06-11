//
//  MarvelClass.swift
//  Code-Hero
//
//  Created by Petros Barreto da silva on 10/03/20.
//  Copyright © 2020 AliveSi. All rights reserved.
//
import Foundation

// MARK: - MArvelInfo
struct MArvelInfo: Codable {
	let code: Int
	let status: String
	//let copyright, attributionText, attributionHTML: String?
	//let etag: String?
	let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
	let offset, limit, total, count: Int
	let results: [Result]
}

// MARK: - Result
struct Result: Codable {
	let id: Int
	let name, resultDescription: String
	//let modified: Date?
	let thumbnail: Thumbnail
	//let resourceURI: String?
	//let comics, series: Comics?
	//let stories: Stories?
	//let events: Comics?
	let urls: [URLElement]
	
	enum CodingKeys: String, CodingKey {
		case id, name
		case resultDescription = "description"
		case thumbnail, urls
	}
}

// MARK: - Comics
//struct Comics: Codable {
	//let available: Int?
	//let collectionURI: String?
	//let items: [ComicsItem]?
	//let returned: Int?
//}

// MARK: - ComicsItem
//struct ComicsItem: Codable {
//	let resourceURI: String?
//	let name: String?
//}

// MARK: - Stories
//struct Stories: Codable {
//	let available: Int?
//	let collectionURI: String?
//	let items: [StoriesItem]?
//	let returned: Int?
//}

// MARK: - StoriesItem
//struct StoriesItem: Codable {
//	let resourceURI: String?
//	let name: String?
//	let type: TypeEnum?
//}

//enum TypeEnum: String, Codable {
//	case cover = "cover"
//	case interiorStory = "interiorStory"
//}

// MARK: - Thumbnail
struct Thumbnail: Codable {
	let path: String
	let thumbnailExtension: String
	
	var url: String {
		return path + "." + thumbnailExtension
	}
	
	enum CodingKeys: String, CodingKey {
		case path
		case thumbnailExtension = "extension"
	}
}

// MARK: - URLElement
struct URLElement: Codable {
	let type: String
	let url: String
}
