//
//  NovaVacinaCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 27/11/23.
//

import SwiftUI

struct NovaVacinaCard: View {
    @Binding var nomeVacina: String
    @Binding var descricaoVacina: String
    @Binding var dataVacina: Date
    
    var body: some View {
        List{
            Section(header: Text("Adicionar Nova Vacina")){
                HStack {
                    Text("Nome da Vacina")
                        .frame(width: 150, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Nome da Vacina", text: $nomeVacina)
                }
                HStack {
                    Text("Descrição:")
                        .frame(width: 150, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    TextField("Descrição da Vacina", text: $descricaoVacina)
                }
                HStack {
                    Text("Data de vacina")
                        .frame(width: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    DatePicker("", selection: $dataVacina, displayedComponents: .date)
                }
            }
            
            .listRowBackground(Color.white)
        }
        .scrollDisabled(true)
        
    }
}

