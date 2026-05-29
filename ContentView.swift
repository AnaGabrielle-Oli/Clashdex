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
            NavigationStack {
                ZStack {
                    appGradient
                    InitialView()
                }
            }
            .tabItem {
                Label("Inicio", systemImage: "crown")
            }

            NavigationStack {
                ZStack {
                    appGradient
                    VStack{ 
                        CreateDeckView()

                    }
                }
            }
            .tabItem {
                Label("Decks", systemImage: "book.closed.fill")
            }

            NavigationStack {
                ZStack {
                    appGradient
                    SearchView()
                }
            }
            .tabItem {
                Label("Buscar", systemImage: "magnifyingglass")
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

