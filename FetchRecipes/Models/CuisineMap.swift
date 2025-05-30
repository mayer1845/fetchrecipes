//
//  CuisineMap.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/30/25.
//

import Foundation

struct CuisineMap : Codable, Hashable {
    var cuisineName : String
    var recipes : [Recipe]
    
    init(name : String) {
        cuisineName = name
        recipes = []
    }
}
