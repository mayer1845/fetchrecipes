//
//  RecipeDetailView.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/30/25.
//

import SwiftUI

struct RecipeDetailView: View {
    @State private var selectedTab: DetailTabs = .web
    let recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
        if (recipe.source_url == nil) {
            selectedTab = .video
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    if (recipe.source_url != nil) {
                        Tab(DetailTabs.web.name, systemImage: DetailTabs.web.symbol, value: .web) {
                            RecipeWebView(recipe: recipe)
                        }
                        .customizationID(DetailTabs.web.customizationID)
                    }
                    if (recipe.youtube_url != nil) {
                        Tab(DetailTabs.video.name, systemImage: DetailTabs.video.symbol, value: .video) {
                            RecipeVideoView(recipe: recipe)
                        }
                        .customizationID(DetailTabs.video.customizationID)
                    }
                 }
 
             }
        }
    }
}

#Preview {
    let previewRecipe = Recipe(cuisine: "Italian", name: "Shrimp Parm")
    RecipeDetailView(recipe: previewRecipe)
}
