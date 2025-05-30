//
//  DetailTabs.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/30/25.
//

import Foundation

enum DetailTabs: Equatable, Hashable, Identifiable {
    case web
    case video
    
    var id: Int {
        switch self {
        case .web: 2001
        case .video: 2002
        }
    }
    
    var name: String {
        switch self {
        case .web: "Read"
        case .video: "Watch"
        }
    }
    
    var symbol: String {
        switch self {
        case .web: "document"
        case .video: "video"
        }
    }
    
    var customizationID: String {
        return "com.com.fetchtext.FetchRecipes" + self.name
    }
}
