//
//  SearchView.swift
//  Projetos
//
//  Created by Ricardo on 25/05/26.
//

import SwiftUI

struct SearchView: View {
    @State var troopID: Card.ID?
    @State var searchText: String = ""
    
    @State  var troops: [Card] = []
    
    var body: some View {
        
        

        
        VStack{
            HStack{
                Text("Busca")
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 50)
                Spacer()
            }
            NavigationStack{
                
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
}

struct CategoriaBusca: View {
    var titulo: String

    
    var body: some View {
        NavigationLink {
            
            ContentView()
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
