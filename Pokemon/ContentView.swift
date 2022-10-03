//
//  ContentView.swift
//  Pokemon
//
//  Created by Sai Lakshmi on 9/30/22.
// Pokemon API - https://pokedex-bb36f.firebaseio.com/pokemon.json

import SwiftUI

struct ContentView: View {
    var body: some View {
        PokemonGridView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGridView()
    }
}
