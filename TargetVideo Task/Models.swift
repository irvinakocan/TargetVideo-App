//
//  Models.swift
//  TargetVideo Task
//
//  Created by Macbook Air 2017 on 28. 1. 2025..
//

import Foundation

struct YouTubeResponse: Codable {
    let items: [YouTubeItem]
    let nextPageToken: String
}

struct YouTubeItem: Codable {
    let id: String
    let snippet: Snippet
}

struct Snippet: Codable {
    let title: String
    let description: String
    let thumbnails: Thumbnails
}

struct Thumbnails: Codable {
    let medium: MediumThumbnail
}

struct MediumThumbnail: Codable {
    let url: String
}
