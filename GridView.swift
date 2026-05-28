//
//  GridView.swift
//  Clashdex
//
//  Created by Aluno Mack on 26/05/26.
//

import SwiftUI

struct GridView: View {
    let keyWord: String
    
    let rarityWord: [String] = ["Common", "Rare", "Epic", "Legendary"]
    let typeWord: [String] = ["Troop", "Building", "Spell"]
    
    var body: some View {
        if !rarityWord.contains(keyWord) && !typeWord.contains(keyWord){
            Text("Não encontrado!")
        }else{
            if rarityWord.contains(keyWord){
                GridCards()
            }else if typeWord.contains(keyWord){
                GridCards()
            }
        }
    }
}

struct GridCards: View {
    let columnsCount: Int = 4
    
    let gridSpacing: CGFloat = 16

    var body: some View {
         ScrollView {
             LazyVGrid(columns: Array(repeating: .init(
                        .flexible(), spacing: gridSpacing
                    ),
                    count: columnsCount
             )) {
                 CardInGrid()
             }
         }.task {
             try? await cards = CardsAPI.fetchCard()
         }
    }
}

struct CardInGrid: View {
    var body: some View{
        Button(""){
            
        }.frame(width: 73, height: 96)
            .foregroundStyle(.white)
            .background(Color.gray)
            .cornerRadius(10)
    }
}

#Preview {
    GridView(keyWord: "oi")
}
