//
//  SearchView.swift
//  Projetos
//
//  Created by Aluno Mack on 25/05/26.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if searchText.isEmpty {
                    HStack {
                        VStack {
                            CategoriaBusca(titulo: "Tropas", keyWord: "Troop")
                            CategoriaBusca(titulo: "Feitiços", keyWord: "Spell")
                            CategoriaBusca(titulo: "Goblin", keyWord: "goblinCards")
                            CategoriaBusca(titulo: "Esqueletos", keyWord: "skeletonCards")
                            CategoriaBusca(titulo: "Evoluídos", keyWord: "evolvedCards")
                        }
                        
                        VStack {
                            CategoriaBusca(titulo: "Construções", keyWord: "Building")
                            CategoriaBusca(titulo: "Aéreos", keyWord: "aerialCards")
                            CategoriaBusca(titulo: "Bárbaros", keyWord: "barbarianCards")
                            CategoriaBusca(titulo: "Tanques", keyWord: "tankCards")
                            CategoriaBusca(titulo: "Win-Conditions", keyWord: "winConditions")
                        }
                    }
                } else {
                    GridView(keyWord: searchText)
                }
            }
            .navigationTitle(searchText.isEmpty ? "Buscar" : "Resultados")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Buscar carta"
            )
        }
    }
}


struct CategoriaBusca: View {
    var titulo: String
    var keyWord: String
    
    var body: some View {
        NavigationLink {
            GridView(keyWord: keyWord)
        } label: {
            Text(titulo)
                .frame(width: 159, height: 104)
                .foregroundStyle(.white)
                .background(Color.black)
                .cornerRadius(30)
        }
    }
}

#Preview {
    SearchView()
}
