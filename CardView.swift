//
//  CardView.swift
//  Aula01
//
//  Created by Aluno Mack on 25/05/26.
//

import SwiftUI


struct CardView: View {
    let card: Card
    
    var backgroundColor: Color {
        switch card.rarity {
        case "Common":
            return Color(red: 41/255, green: 124/255, blue: 179/255).opacity(0.2)
        case "Rare":
            return Color(red: 250/255, green: 137/255, blue: 8/255).opacity(0.2)
        case "Epic":
            return Color(red: 175/255, green: 113/255, blue: 253/255).opacity(0.2)
        case "Legendary":
            return Color(red: 82/255, green: 205/255, blue: 161/255).opacity(0.2)
        case "Champion":
            return Color(red: 255/255, green: 220/255, blue: 54/255).opacity(0.2)
        default:
            return Color.gray.opacity(0.2)
        }
    }
    
    var body: some View {
        
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            VStack(spacing: 12) {
                
                CardImageView(card: card)
                    .padding(.top, 20)
                
                Text(card.name)
                    .font(.largeTitle)
                    .bold()
                
                TabView {
                    AboutPage(card: card)
                    
                    StatisticPage(card: card)
                }
                .tabViewStyle(.page)
                .background(backgroundColor)
                .frame(width: 280, height: 250)
                .cornerRadius(20)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 60)
        }
    }
    
}

struct CardImageView: View {
    let card: Card
    
    var body: some View {
        
        let imageName = card.key.replacingOccurrences(of: "-", with: "_")

        if let path = Bundle.main.path(
            forResource: imageName,
            ofType: "png"
        ),
        let uiImage = UIImage(contentsOfFile: path) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 300)
        } else {
                ProgressView()
        }
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
