//
//  CardView.swift
//  Clashdex
//
//  Created by Aluno Mack on 22/05/26.
//

import SwiftUI

struct CardView: View {
    

    var body: some View {

        CardImageView(imagem: "rayquaza")
        
        TabView {
            AboutPage(info: "ele tem uma espada")
            
            Text("teste")
        }
        .tabViewStyle(.page)
        .background(.gray)
        .frame(width: 269, height: 237)

    }
}

struct CardImageView: View{
    var imagem: String
    var body: some View{
        Image(imagem)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
    }
}
struct AboutPage: View{
    var info: String
    
    var body: some View{
        Text(info)
    }
}

struct StatisticPage: View{
    
    var body: some View{
        Text("teste1")
    }
}

#Preview {
    CardView()
}
