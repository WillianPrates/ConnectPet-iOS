//
//  ConsultaView.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI

struct ConsultaView: View {
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var consulta: [FakeConsulta] = [
        FakeConsulta(especialista: "Dra. Letícia", parecerMedico: "Tomar medicação três vezes ao dia. Cuidar o comportamento do pet. Retornar se algo acontecer. ", dataConsulta: "22/10/2023"),
        FakeConsulta(especialista: "Dra. Déborah", parecerMedico: "Tomar medicação três vezes ao dia. Cuidar o comportamento do pet. Retornar se algo acontecer. ", dataConsulta: "22/10/2023"),
        FakeConsulta(especialista: "Dra. Giovanna", parecerMedico: "Tomar medicação três vezes ao dia. Cuidar o comportamento do pet. Retornar se algo acontecer. ", dataConsulta: "22/10/2023")
        ]
    
    var body: some View {
        VStack{
            NovaConsultaCard(consulta: FakeConsulta(especialista: "", parecerMedico: "", dataConsulta: ""))
                .frame(height: 270)

            List{
                Section(header: Text("Histórico de Consultas")){
                ForEach(consulta, id: \.self){ consulta in
                    HStack{
                        VStack{
                            Image(systemName: "heart.text.square")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .foregroundColor(.historicoList)
                                .padding(.top)
                            Spacer()
                        }
                        
                        VStack {
                            HStack {
                                Text("Especialista:")
                                    .bold()
                                    .padding(.top,3)
                                Text(consulta.especialista)
                                    .padding(.top,3)
                                Spacer()
                            }
                            HStack {
                                Text("Data:")
                                    .bold()
                                Text(consulta.dataConsulta)
                                Spacer()
                            }
                            HStack {
                                Text("Parecer médico:")
                                    .bold()
                                Spacer()
                            }
                            HStack{
                                Text(consulta.parecerMedico)
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
    ConsultaView()
}
