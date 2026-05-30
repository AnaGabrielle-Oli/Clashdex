//
//  ContentView.swift
//  Aula01
//
//  Created by Aluno Mack on 25/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {

            Tab("Inicio", systemImage: "crown") {
                NavigationStack {
                    ZStack {
                        appGradient
                        InitialView()
                    }
                }
            }

            Tab("Decks", systemImage: "book.closed.fill") {
                NavigationStack {
                    ZStack {
                        appGradient
                        VStack{
                            CreateDeckView()
                            
                        }
                    }
                }
            }

            Tab(role: .search) {
                NavigationStack {
                    ZStack {
                        appGradient
                        SearchView()
                    }
                }
            }
        }
    }

    var appGradient: some View {
        LinearGradient(
            colors: [
                Color.blue.opacity(0.35),
                Color.green.opacity(0.30),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

