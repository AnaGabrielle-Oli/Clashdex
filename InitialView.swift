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
                Text("ola")
            }label:{
                Text("Comum")
                    .textStyled()
            }
            
            NavigationLink{
                Text("ola")
            }label: {
                Text("Raro")
                    .textStyled()
            }
            
            NavigationLink{
                Text("a")
            }label: {
                Text("Épico")
                    .textStyled()
            }
            
            NavigationLink{
                Text("a")
            }label: {
                Text("Lendário")
                    .textStyled()
            }
            
            
        }

    }
    
     
}
struct TextModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 330, height: 128)
            .background(.black)
            .contentShape(Rectangle())
            .padding(6)
    }
}

extension View{
    func textStyled() -> some View{
        modifier(TextModifier())
    }
}

#Preview {
    InitialView()
}
