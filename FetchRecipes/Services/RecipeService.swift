//
//  RecipeService.swift
//  FetchRecipes
//
//  Created by Robert Mayer on 5/29/25.
//

import Foundation

@MainActor
struct RecipeService {
    
    func getRecipes(url: String) async throws -> RecipeList {
        let requestUrl = URL(string: url)
        let (data, response) = try await URLSession.shared.data(from: requestUrl!)
        guard let response = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        let statusCode = response.statusCode
        guard (200...299).contains(statusCode) else {
            throw URLError(.resourceUnavailable)
        }
        guard response.value(forHTTPHeaderField: "content-type") == "application/json" else {
            throw URLError(.cannotDecodeContentData)
        }
        do {
            let recipeList : RecipeList = try JSONDecoder().decode(RecipeList.self, from: data)
            return recipeList
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }

}
