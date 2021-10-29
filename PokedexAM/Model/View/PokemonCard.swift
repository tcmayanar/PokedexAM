//
//  PokemonCard.swift
//  PokedexAM
//
//  Created by AMStudent on 10/20/21.
//

import SwiftUI
import Kingfisher

struct PokemonCard: View {
    
    let pokemonData: PokemonData
    let pokemonViewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemonData: PokemonData, pokemonViewModel:                                      PokemonViewModel) {
        self.pokemonData = pokemonData
        self.pokemonViewModel = pokemonViewModel
        self.backgroundColor =                           Color(pokemonViewModel.detectBackgroundColor(forType:                          pokemonData.type))
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemonData.name.uppercased())
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding(.leading)
                
                HStack {
                    Text(pokemonData.type.uppercased())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                    
                        .overlay(RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.25))
                    
                    )
                    
                        .frame(width: 100, height: 25)
                    
                    
                    KFImage(URL(string: pokemonData.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 5)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius:  8, x: 0, y: 0)
    }
}

//struct PokemonCard_Previews: PreviewProvider {
    //static var previews: some View {
        //PokemonCard(pokemonData: mockData[0])
    //}
//}
