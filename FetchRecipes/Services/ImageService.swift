//
//  ImageService.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/30/25.
//

import Foundation
import UIKit

@MainActor
class ImageService {
    
    nonisolated init() {
    }
        
    func getImageFromUrl(url: String) async -> UIImage {
        let requestUrl = URL(string: url)
        var image : UIImage = UIImage(systemName: "fork.knife.circle")!
        do {
            let (data, response) = try await URLSession.shared.data(from: requestUrl!)
            image = UIImage(data: data)!
            return image
        } catch {
            return image
        }
    }

}
