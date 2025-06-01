//
//  FetchRecipesTests.swift
//  FetchRecipesTests
//
//  Created by Robert Mayer on 5/29/25.
//

import Testing
@testable import FetchRecipes
import Foundation

struct FetchRecipesTests {

    @Test func malformedData() async throws {
        var gotException = false
        do {
            let recipeService = await RecipeService()
            var recipeList : RecipeList = try await recipeService.getRecipes(url: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
        } catch URLError.cannotDecodeContentData {
            gotException = true
        }
        #expect(gotException) 
    }

    @Test func emptyData() async throws {
        var recipeList : RecipeList = RecipeList()
        recipeList.add(recipe: Recipe(cuisine: "Test", name:"title"))
        do {
            let recipeService = await RecipeService()
            recipeList = try await recipeService.getRecipes(url: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
        } catch URLError.cannotDecodeContentData {
            print("exception occured")
        }
        #expect(recipeList.recipes.count == 0)
    }

    @Test func cachedImage() async throws {
        let url = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
        let imageSrvc = ImageService()
        let image = await imageSrvc.getImageFromUrl(url: url)
        let recipeImage = RecipeImage()
        recipeImage.saveImage(name: url, image: image)
        
        let savedImage = recipeImage.getSavedImage(name: url)
        #expect(savedImage?.pngData() == image.pngData())
   }



}
