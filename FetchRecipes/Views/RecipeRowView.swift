//
//  RecipeRowView.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/29/25.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            if let thumbnailURL = recipe.photo_url_small {
                AsyncImage(url: URL(string: thumbnailURL)){ result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 50, height: 50)
                .fixedSize(horizontal: true, vertical: true)
             } else {
                Image(systemName: ".fork.knife")
            }
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
        .padding(.horizontal, 10)
    }
}

#Preview {
    let previewRecipe = Recipe(cuisine: "Italian", name: "Shrimp Parm")
    RecipeRowView(recipe: previewRecipe)
}
