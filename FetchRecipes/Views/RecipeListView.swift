//
//  RecipeListView.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/29/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @State private var cuisineDictionary: [String : CuisineMap] = [:]
    @State private var sortOrder = [KeyPathComparator(\Recipe.cuisine)]
        
    var body: some View {
        VStack(spacing: 0) {
            Text("Recipes")
                .font(.headline)
                .padding(.bottom, 20)
            let keyArray = Array(cuisineDictionary.keys).sorted()
            NavigationStack {
                List {
                    ForEach(keyArray, id: \.self) { key in
                        Section(header: Text(key).font(.title)) {
                            let cmap = cuisineDictionary[key]
                            let recipeArray = cmap!.recipes
                            ForEach(recipeArray, id: \.self) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                    RecipeRowView(recipe: recipe)
                                        .padding(.vertical, 5)
                                }
                                .padding(.horizontal, 5)
                            }
                            .listRowBackground(Color.clear)
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .listStyle(PlainListStyle())
                .safeAreaInset(edge: .bottom) {
                    Text("")
                        .frame(height: 5)
                        .frame(maxWidth: .infinity)
                }
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity)
            .padding(.top, -8)
            .overlay { if cuisineDictionary.isEmpty { ProgressView() } }
            .task { await readRecipe() }
            .refreshable { await readRecipe() }
        }
    }
    
    @available(iOS 13, *)
    func readRecipe() async {
        let recipeService = RecipeService()
        var recipeList = RecipeList()
        do {
            try recipeList = await recipeService.getRecipes(url: Common.recipeUrlString)
            let recipes = recipeList.recipes
            cuisineDictionary = [:]
            for recipe in recipes {
                if (cuisineDictionary.keys.contains(recipe.cuisine)) {
                    cuisineDictionary[recipe.cuisine]?.recipes.append(recipe)
                } else {
                    var newMap = CuisineMap(name: recipe.cuisine)
                    newMap.recipes.append(recipe)
                    cuisineDictionary[recipe.cuisine] = newMap
                }
            }
        }
        catch {
            
        }
    }
}

#Preview {

    RecipeListView()
}
