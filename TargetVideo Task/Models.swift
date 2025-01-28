//
//  Models.swift
//  TargetVideo Task
//
//  Created by Macbook Air 2017 on 28. 1. 2025..
//

import Foundation

struct YouTubeResponse {
    let items: [YouTubeItem]
}

struct YouTubeItem {
    let id: String
    let snippet: Snippet
}

struct Snippet {
    let title: String
    let description: String
    let thumbnails: Thumbnails
}

struct Thumbnails {
    let medium: MediumThumbnail
}

struct MediumThumbnail {
    let url: String
}
