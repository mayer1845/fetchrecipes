//
//  RecipeRowView.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/29/25.
//

import SwiftUI

struct RecipeRowView: View {
    @State private var image = UIImage(systemName: "fork.knife.circle")
    let recipe: Recipe
    
    var body: some View {
        HStack {
            Image(uiImage: image!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .fixedSize(horizontal: true, vertical: true)
                .task{ await readImage(name: recipe.photo_url_small!)}
            Text(recipe.name)
                .font(.headline)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 10)
            Spacer()
            if (recipe.source_url != nil) {
                Image(systemName: "document")
            }
            if (recipe.youtube_url != nil) {
                Image(systemName: "video")
            }
        }
    }
    
    func readImage(name: String) async {
        let ri = RecipeImage()
        image = await ri.getImage(url: name)
    }
    
}
