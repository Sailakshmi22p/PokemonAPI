//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Sai Lakshmi on 9/30/22.
//

import SwiftUI
import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: baseUrl) else { return }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // to remove null value in the data
            guard let data = data?.parseData(removeString: "null,") else { return }
            
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            // store this data
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }
        .resume() // resumes the task if it is suspended
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .orange
        case "poison": return .purple
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .brown
        case "normal": return .magenta
        case "ground": return .green
        case "flying": return .cyan
        case "fairy": return .systemTeal
        default: return .systemPink
            
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self , encoding: .utf8)
        // replacing all the occurrences of the null value in the string data to an empty string
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        // convert the String type data to Data type
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        
        return data
    }
}

