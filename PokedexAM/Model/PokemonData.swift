//
//  PokemonData.swift
//  PokedexAM
//
//  Created by AMStudent on 10/20/21.
//

import Foundation

struct PokemonData: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Float
    let height: Float
    let description: String
    let attack: Float
    let defense: Float
}

//let mockData: [PokemonData] = [
//    .init(id: 0, name: "Bulbasaur", type: "poison", weight: 15, height: 80, description: "Bulbasaur is a thing that people know about", attack: 30, defense: 18),
 //   .init(id: 1, name: "Karen", type: "angry person", weight: 300, height: 120, description: "Stay away", attack: 90, defense: 3),
//]
