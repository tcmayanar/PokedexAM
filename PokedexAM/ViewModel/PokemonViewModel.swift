//
//  PokemonViewModel.swift
//  PokedexAM
//
//  Created by AMStudent on 10/20/21.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    
    @Published var pokemon = [PokemonData]()
    
    let apiURL = "https://firebasestorage.googleapis.com/v0/b/pokedex-74957.appspot.com/o/Copy%20of%20Pokemon%20Details%20-%20Transformed%20by%20Data.Page%20(4).json?alt=media&token=d986f3aa-4c3d-47c3-81fc-ca21475163f0"
    
    init() {
        fetchPokemonData()
    }
    
    func fetchPokemonData() {
        guard let url = URL(string: apiURL) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, reponse, error) in
            guard let cleanData = data?.parseData(removeString: "null,") else { return }
            
            DispatchQueue.main.async {
                do {
                    let pokemon = try
                        JSONDecoder().decode([PokemonData].self,                             from: cleanData)
                    self.pokemon = pokemon
                } catch {
                    print("error msg:", error)
                }
            }
        }
        task.resume()
    }
    
    func detectBackgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "water": return .systemBlue
        case "poison": return .systemGreen
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemGray
        case "ground": return .brown
        case "flying": return .systemTeal
        case "fairy": return .systemPink
        default: return .systemIndigo
        }
     }
}


extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString? .replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8)                              else { return nil }
        
        return data
        }
}
