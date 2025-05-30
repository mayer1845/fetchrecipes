//
//  Recipes.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/29/25.
//

// Data model file for recipes data.  Sample data:
// {
//     "recipes": [
//         {
//             "cuisine": "British",
//             "name": "Bakewell Tart",
//             "photo_url_large": "https://some.url/large.jpg",
//             "photo_url_small": "https://some.url/small.jpg",
//             "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
//             "source_url": "https://some.url/index.html",
//             "youtube_url": "https://www.youtube.com/watch?v=some.id"
//        },
//         ...
//     ]
// }

import Foundation

struct Recipe : Codable, Hashable, Identifiable {
    var id: UUID
    
    var cuisine : String!
    var name : String!
    var photo_url_large : String?
    var photo_url_small : String?
    var uuid : String!
    var source_url : String!
    var youtube_url : String!
    
    private enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photo_url_large
        case photo_url_small
        case uuid
        case source_url
        case youtube_url
    }
    
    init(from decoder: Decoder) throws {
        self.id = Self.ID()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cuisine  = try container.decodeIfPresent(String.self, forKey: .cuisine)
        self.name  = try container.decodeIfPresent(String.self, forKey: .name)
        self.photo_url_large  = try container.decodeIfPresent(String.self, forKey: .photo_url_large)
        self.photo_url_small  = try container.decodeIfPresent(String.self, forKey: .photo_url_small)
        self.uuid  = try container.decodeIfPresent(String.self, forKey: .uuid)
        self.source_url  = try container.decodeIfPresent(String.self, forKey: .source_url)
        self.youtube_url  = try container.decodeIfPresent(String.self, forKey: .youtube_url)
 }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cuisine, forKey: .cuisine)
        try container.encode(name, forKey: .name)
        try container.encode(photo_url_large, forKey: .photo_url_large)
        try container.encode(photo_url_small, forKey: .photo_url_small)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(source_url, forKey: .source_url)
        try container.encode(youtube_url, forKey: .youtube_url)
   }

    init(cuisine: String, name: String) {
        self.id = Self.ID()
        self.cuisine = cuisine
        self.name = cuisine
        uuid = ""
        photo_url_large = ""
        photo_url_small = ""
        uuid = ""
        source_url = ""
        youtube_url = ""
    }
}
