//
//  SearchView.swift
//  Projetos
//
//  Created by Aluno Mack on 25/05/26.
//

import SwiftUI

struct SearchView: View {
    
    //@State var troopID: Card.ID?
    @State var searchText: String = ""
    
    //@State  var troops: [Card] = []*/
    
    var body: some View {
        @State var searchText = ""
        
        
        
        NavigationStack{

            HStack{
                
                VStack{
                    CategoriaBusca(titulo: "Tropas")
                    CategoriaBusca(titulo: "Tropas")
                    CategoriaBusca(titulo: "Tropas")
                    CategoriaBusca(titulo: "Tropas")
                    CategoriaBusca(titulo: "Tropas")
                }
                
                VStack{
                    CategoriaBusca(titulo: "Tropas")
                    CategoriaBusca(titulo: "Tropas")
                    CategoriaBusca(titulo: "Tropas")
                    CategoriaBusca(titulo: "Tropas")
                    CategoriaBusca(titulo: "Tropas")
                }
            }
            .navigationTitle("Buscar")
            .searchable(text: $searchText, prompt: "Buscar carta")
            
            
        }
        
    }
}

struct CategoriaBusca: View {
    var titulo: String
    
    var body: some View {
        NavigationLink {
            GridView(keyWord: titulo)
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
