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
                    ScrollView{
                        HStack(spacing: 16) {
                            VStack(spacing: 12) {
                                CategoriaBusca(titulo: "Tropas", keyWord: "Troop")
                                CategoriaBusca(titulo: "Feitiços", keyWord: "Spell")
                                CategoriaBusca(titulo: "Goblin", keyWord: "goblin")
                                CategoriaBusca(titulo: "Esqueletos", keyWord: "skeleton")
                                CategoriaBusca(titulo: "Evoluídos", keyWord: "evolved")
                            }
                            
                            VStack(spacing: 12) {
                                CategoriaBusca(titulo: "Construções", keyWord: "Building")
                                CategoriaBusca(titulo: "Aéreos", keyWord: "aerial")
                                CategoriaBusca(titulo: "Bárbaros", keyWord: "barbarian")
                                CategoriaBusca(titulo: "Tanques", keyWord: "tank")
                                CategoriaBusca(titulo: "Win-Conditions", keyWord: "winCondition")
                            }
                        }
                        .padding(.horizontal)
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
                .font(.headline)
                .frame(width: 159, height: 104)
                .foregroundStyle(.white)
                .background(Color.black)
                .cornerRadius(20)
        }
    }
}

#Preview {
    SearchView()
}
