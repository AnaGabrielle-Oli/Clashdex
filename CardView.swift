//
//  CardView.swift
//  Clashdex
//
//  Created by Aluno Mack on 22/05/26.
//

import SwiftUI

struct CardView: View {
    @State var cards: [Card] = []
    
    var body: some View {
        VStack {
            List(cards) { card in
                HStack{
                    Text(card.name)
                }
            }
        }
        .padding()
        .task{
            try? await cards = CardsAPI.fetchCard()
        }
    }
}

#Preview {
    CardView()
}
