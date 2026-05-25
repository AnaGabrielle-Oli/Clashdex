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
            .offset(x: -110, y: -44)
        
        Categoria(titulo: "comum")
        Categoria(titulo: "rara")
        Categoria(titulo: "epica")
        Categoria(titulo: "lendario")
        


    }
    
     
}

struct Categoria: View {
    var titulo: String
    

    var body: some View {
        ZStack{
            Button(titulo){
                
            }.frame(width: 330, height: 128)
                .foregroundStyle(.white)
                .background(Color.black)
                .cornerRadius(30)
                
        }
        
             
    }
}
#Preview {
    InitialView()
    
}
