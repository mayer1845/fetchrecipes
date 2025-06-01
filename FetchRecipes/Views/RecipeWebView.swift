//
//  RecipeWebView.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/30/25.
//

import SwiftUI
import WebKit

struct RecipeWebView: View {
    var recipe : Recipe
    
    var body: some View {
        VStack(spacing: 0) {
            Text(recipe.name)
                .font(.title)
                .padding(.vertical, 5)
            WebView(request: URLRequest(url: URL(string: recipe.source_url)!))
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
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            // Show error view
        }

    }
}


#Preview {
    let previewRecipe = Recipe(cuisine: "Italian", name: "Shrimp Parm")
    RecipeWebView(recipe: previewRecipe)
}
