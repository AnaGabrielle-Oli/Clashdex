//
//  ContentView.swift
//  Aula01
//
//  Created by Aluno Mack on 25/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationStack{
                InitialView()
            }.tabItem {
                Label("Inicio", systemImage: "crown")
            }
             
            NavigationStack{
                SearchView()
            }.tabItem {
                Label("Buscar", systemImage: "magnifyingglass")
            }
            
            NavigationStack{
                CreateDeckView()
            }.tabItem {
                Label("Decks", systemImage: "book.closed.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
