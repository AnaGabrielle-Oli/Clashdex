
//
//  InitialView.swift
//  Aula01
//
//  Created by Aluno Mack on 22/05/26.
//

import SwiftUI

struct InitialView: View {
    
    var body: some View {
        VStack(spacing: 14) {
            Text("Inicio")
                .font(.title)
                .bold()
                .padding(.top, 40)
            
            ScrollView{
                NavigationLink {
                    GridView(keyWord: "Common")
                } label: {
                    Text("Comum")
                        .frame(width: 330, height: 110)
                        .background(Color(red: 41/255, green: 124/255, blue: 179/255))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .bold()
                }
                
                NavigationLink {
                    GridView(keyWord: "Rare")
                } label: {
                    Text("Raro")
                        .frame(width: 330, height: 110)
                        .background(Color(red: 250/255, green: 137/255, blue: 8/255))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .bold()
                }
                
                NavigationLink {
                    GridView(keyWord: "Epic")
                } label: {
                    Text("Épico")
                        .frame(width: 330, height: 110)
                        .background(Color(red: 114/255, green: 64/255, blue: 254/255))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .bold()
                }
                
                NavigationLink {
                    GridView(keyWord: "Legendary")
                } label: {
                    Text("Lendário")
                        .frame(width: 330, height: 110)
                        .background(Color(red: 82/255, green: 205/255, blue: 161/255))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .bold()
                    
                }
                NavigationLink {
                    GridView(keyWord: "Champion")
                } label: {
                    Text("Campeões")
                        .frame(width: 330, height: 110)
                        .background(Color(red: 25/255, green: 220/255, blue: 54/255))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .bold()
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    InitialView()
}
