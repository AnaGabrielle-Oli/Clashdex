//
//  CardView.swift
//  Aula01
//
//  Created by Aluno Mack on 25/05/26.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        VStack(spacing: 20) {
            
            CardImageView(card: card)
            
            Text(card.name)
                .font(.largeTitle)
                .bold()
            
            TabView {
                AboutPage(card: card)
                
                StatisticPage(card: card)
            }
            .tabViewStyle(.page)
            .background(.gray)
            .frame(width: 269, height: 237)
        }
        .padding()
    }
}

struct CardImageView: View {
    let card: Card
    
    var body: some View {
        Image(card.key)
            .resizable()
            .scaledToFit()
            .frame(width: 700, height: 200)
    }
}

struct AboutPage: View {
    let card: Card
        
    var body: some View {
        VStack(spacing: 12) {
            Text("Sobre")
                .font(.title2)
                .bold()
            
            Text(card.description)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct StatisticPage: View {
    let card: Card
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Estatísticas")
                .font(.title2)
                .bold()
            
            Text("Elixir: \(card.elixir)")
            Text("Raridade: \(card.rarity)")
            Text("Tipo: \(card.type)")
            Text("Arena: \(card.arena)")
        }
    }
}

#Preview {
    CardView(card: .exemplo)
}
