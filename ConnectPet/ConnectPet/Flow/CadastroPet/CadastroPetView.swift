//
//  CadastroView.swift
//  ConnectPet
//
//  Created by Foundastion03 on 23/11/23.
//

import SwiftUI

struct CadastroPetView: View {
    @StateObject private var cadastroPetViewModel: CadastroPetViewModel = CadastroPetViewModel()
    @State private var nomePet: String = ""
    @State private var raca: String = ""
    @State private var peso: String = ""
    @State private var dataNasc = Date()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Novo Pet")
                HStack{
                    Text("Nome do Pet")
                        .padding()
                    
                    TextField("Nome do pet", text: $nomePet)
                        .keyboardType(.decimalPad)
                        .bold()
                        .font(.system(size: 15))
                        .padding(.trailing)
                }
                HStack{
                    Text("Data de Nasc")
                        .padding()
                    
                    DatePicker("", selection: $dataNasc, displayedComponents: .date)
                        .accentColor(Color("color.purple"))
                        .padding(.trailing)

                }
                                
            }
        }
    }
}

#Preview {
    CadastroPetView()
}
