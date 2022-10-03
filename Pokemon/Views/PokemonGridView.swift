//
//  PokemonGridView.swift
//  Pokemon
//
//  Created by Sai Lakshmi on 10/2/22.
//

import SwiftUI

struct PokemonGridView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2),Color.yellow.opacity(0.3) ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(viewModel.pokemon) { pokemon in
                            NavigationLink {
                                PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                            } label: {
                                PokeCell(pokemon: pokemon, viewModel: viewModel)
                            }

                            
                        }
                    }
                }
            }
        }
    }
}

struct PokemonGridView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGridView()
    }
}
