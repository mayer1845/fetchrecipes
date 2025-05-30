//
//  RecipeVideoView.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/30/25.
//

import SwiftUI
import WebKit

struct RecipeVideoView: View {
    var recipe : Recipe
    
    var body: some View {
        VStack(spacing: 0) {
            Text(recipe.name)
                .font(.title)
                .padding(.vertical, 5)
            WebView(request: URLRequest(url: URL(string: recipe.youtube_url)!))
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct WebView: UIViewRepresentable {
        let request: URLRequest
        
        func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
        
        func updateUIView(_ uiView: WKWebView, context: Context) {
            uiView.load(request)
        }
    }
}

#Preview {
    let previewRecipe = Recipe(cuisine: "Italian", name: "Shrimp Parm")
    RecipeVideoView(recipe: previewRecipe)
}
