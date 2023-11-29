//
//  ExameView.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI

struct ExameView: View {
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var exame: [FakeExame] = [
        FakeExame(descricaoExame: "exame de rotina feito na Léia", resultadoExame: "negativo, está tudo bem", nomeExame: "Rotina", dataExame: "29/11/2023"),
        FakeExame(descricaoExame: "paciente Doly", resultadoExame: "tudo certo", nomeExame: "Raio X", dataExame: "29/11/2023"),
        FakeExame(descricaoExame: "Doly estava com suspeita de algo mas está tudo bem", resultadoExame: "negativo, está tudo bem", nomeExame: "Ultrassom", dataExame: "25/11/2023"),
        ]
    
    var body: some View {
        VStack{
            NovoExameCard(exame: FakeExame(descricaoExame: "Doly estava com suspeita de algo mas está tudo bem", resultadoExame: "negativo, está tudo bem", nomeExame: "Ultrassom", dataExame: "25/11/2023"))
                .frame(height: 220)

            List{
                Section(header: Text("Histórico de Exames")){
                ForEach(exame, id: \.self){ exame in
                    HStack{
                        Image(systemName: "pencil.and.list.clipboard")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(.examesList)
                        
                        VStack {
                            HStack {
                                Text(exame.nomeExame)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text(exame.dataExame)
                                Spacer()
                            }
                        }

                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
    .scrollContentBackground(.hidden)
    .background(corBackground)
    
    .toolbar(content: {
        ToolbarItem(placement: .topBarTrailing, content: {
            Button{
                print("Salvar")
            }label: {
                Label("Salvar", systemImage: "")
                    .tint(.blue)
                }
            })
        })
        
   }
}

#Preview {
    NavigationStack {
        ExameView()
    }
}
