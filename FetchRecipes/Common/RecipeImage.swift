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
        let fileImage = getSavedImage(name: url)
        if  (fileImage != nil) {
            return fileImage!
        } else {
            let imageSrvc = ImageService()
            image = await imageSrvc.getImageFromUrl(url: url)
            saveImage(name: url, image: image)
            return image
        }
    }
    
    func saveImage(name: String, image: UIImage) -> Bool {
        let fileName = urlToFileName(url: name)
        let data = image.jpegData(compressionQuality: 1)
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data!.write(to: directory.appendingPathComponent(fileName)!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func getSavedImage(name: String) -> UIImage? {
        let fileName = urlToFileName(url: name)
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask,
                                                  appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(fileName).path)
        }
        return nil
    }
    
    func urlToFileName(url: String) -> String {
        let nameStr = url.replacingOccurrences(of: "/", with: "_")
        return nameStr
    }
}
