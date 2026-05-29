
//
//  InitialView.swift
//  Aula01
//
//  Created by Aluno Mack on 22/05/26.
//

import SwiftUI

struct InitialView: View {
    
    var body: some View {

        Text("Inicio")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
                
        NavigationStack(){
            NavigationLink{
                GridView(keyWord: "Common")
            }label:{
                Text("Comum")
                    .frame(width: 330, height: 128)
                    .background(Color(red: 41/255, green: 124/255, blue: 179/255))
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .contentShape(Rectangle())
                    .padding(6)
            }
            
            NavigationLink{
                GridView(keyWord: "Rare")
            }label: {
                Text("Raro")
                    .frame(width: 330, height: 128)
                    .background(Color(red: 250/255, green: 137/255, blue: 8/255))
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .contentShape(Rectangle())
                    .padding(6)
                    
            }
            
            NavigationLink{
                GridView(keyWord: "Epic")
            }label: {
                Text("Épico")
                    .frame(width: 330, height: 128)
                    .background(Color(red: 114/255, green: 64/255, blue: 254/255))
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .contentShape(Rectangle())
                    .padding(6)
            }
            
            NavigationLink{
                GridView(keyWord: "Legendary")
            }label: {
                Text("Lendário")
                    .frame(width: 330, height: 128)
                    .background(Color(red: 250/255, green: 137/255, blue: 8/255))
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .contentShape(Rectangle())
                    .padding(6)
            }
            
            
        }

    }
    
     
}
/*
struct TextModifier: ViewModifier{
    func body(content: Content) -> some View {
        content.
            

    }
}

extension View{
    func textStyled() -> some View{
        modifier(TextModifier())
    }
}*/

#Preview {
    InitialView()
}
