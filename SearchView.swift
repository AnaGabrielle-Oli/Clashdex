//
//  SearchView.swift
//  Projetos
//
//  Created by Ricardo on 25/05/26.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        Text("Busca")
            .font(.title)
            .bold()
            .offset(x: -110, y: -44)

        
        VStack{
            HStack{
                CategoriaBusca(titulo: "Tropas")
                CategoriaBusca(titulo: "Tropas")
            }
            HStack{
                CategoriaBusca(titulo: "Tropas")
                CategoriaBusca(titulo: "Tropas")
            }
            HStack{
                CategoriaBusca(titulo: "Tropas")
                CategoriaBusca(titulo: "Tropas")
            }
            HStack{
                CategoriaBusca(titulo: "Tropas")
                CategoriaBusca(titulo: "Tropas")
            }
            HStack{
                CategoriaBusca(titulo: "Tropas")
                CategoriaBusca(titulo: "Tropas")
            }
        }
        
                
    }
}

struct CategoriaBusca: View {
    var titulo: String

    var body: some View {
        ZStack{
            Button(titulo){
                
            }.frame(width: 159, height: 104)
                .foregroundStyle(.white)
                .background(Color.black)
                .cornerRadius(30)
                
        }
        
             
    }
}

#Preview {
    SearchView()
}
