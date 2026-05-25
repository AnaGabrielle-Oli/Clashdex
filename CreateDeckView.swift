//
//  CreateDeckView.swift
//  Projetos
//
//  Created by Ricardo on 25/05/26.
//

import SwiftUI

struct CreateDeckView: View {
    var body: some View {
            DeckBar()
            NewDeck()
    }
}

struct CardSelected: View{
    
    var body: some View{
        Button(""){
            
        }.frame(width: 73, height: 96)
            .foregroundStyle(.white)
            .background(Color.gray)
            .cornerRadius(10)
    }
    
    
}

struct DeckBar: View{
    
    var body: some View{
        Button{
            
        }label: {
            VStack{
                HStack(spacing: 20){
                    CardSelected()
                    CardSelected()
                    CardSelected()
                    CardSelected()
                }
                
                HStack(spacing: 20){
                    CardSelected()
                    CardSelected()
                    CardSelected()
                    CardSelected()
                }
    
            }
            .frame(width: 387, height: 231)
            .foregroundStyle(.white)
            .background(Color.black)
            .cornerRadius(10)
            
        }
    }
}

struct NewDeck: View{
    var body: some View{
        Button{
            
        }label: {
            ZStack{
                Circle()
                    .frame(width: 80, height: 80)
                Text("+")
                    .foregroundStyle(.black)
                
            }
        }.frame(width: 387, height: 231)
            .foregroundStyle(.white)
            .background(Color.gray)
            .cornerRadius(10)
            
    }
}

#Preview {
    CreateDeckView()
}
