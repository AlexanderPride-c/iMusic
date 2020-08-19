//
//  SearchResponse.swift
//  iMusic
//
//  Created by Александр Прайд on 19.08.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import UIKit

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
}
