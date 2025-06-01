//
//  RecipeImage.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/31/25.
//

import Foundation
import UIKit

class RecipeImage {
    
    private var image = UIImage(systemName: "fork.knife.circle")!
    
    nonisolated init() {
        image = UIImage(systemName: "fork.knife.circle")!
    }
    
    func getImage(url: String) async -> UIImage {
        let imageSrvc = ImageService()
        image = await imageSrvc.getImageFromUrl(url: url)
        return image
    }

}
