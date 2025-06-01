//
//  RecipeList.swift
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

struct RecipeList : Codable, Hashable {
    var recipes : [Recipe]
    
    init() {
        recipes = []
    }
    
    mutating func add(recipe: Recipe) {
        recipes.append(recipe)
    }
}
