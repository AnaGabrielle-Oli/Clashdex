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
    
    @State var isImageDL: Bool = false
    
    var body: some View {
//        AsyncImage(url: card.imageCharacterURL) { phase in
//            image
//                .resizable()
//                .scaledToFill()
//                .frame(width: 329, height: 342)
//                .clipped()
//                .cornerRadius(10)
//        } placeholder: {
//            ProgressView()
//                .frame(width: 73, height: 96)
//        }
        
        if !isImageDL {
            AsyncImage(url: card.imageCharacterURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 73, height: 96)
                
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 329, height: 342)
                        .clipped()
                        .cornerRadius(10)
                    
                case .failure(let error):
                    ProgressView()
                        .frame(width: 73, height: 96)
                        .onAppear {
                            print("error: ", error.localizedDescription)
                            isImageDL = true
                            print(isImageDL)
                            print(card.imageCharacterURL?.absoluteString)
                        }
                }
            }
        }
        else {
            AsyncImage(url: card.imageCharacterDLURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 73, height: 96)
                
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 329, height: 342)
                        .clipped()
                        .cornerRadius(10)
                    
                case .failure(let error):
                    ProgressView()
                        .frame(width: 73, height: 96)
                        .task {
                            print("error DL: ", error.localizedDescription)
                            print(card.imageCharacterDLURL?.absoluteString)
                        }
                }
            }
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
