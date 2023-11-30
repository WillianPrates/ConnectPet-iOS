//
//  ConsultaView.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI

struct ConsultaView: View {
    @State var id = UUID()
    @State var especialista: String = ""
    @State var parecerMedico: String = ""
    @State var dataConsulta: Date = Date()
    @State var pet: Pet
    
    @StateObject var consultaViewModel: ConsultaViewModel = ConsultaViewModel()
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Consulta.id, ascending: true)],
        animation: .default) private var consultaFetch: FetchedResults<Consulta>
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack{
            NovaConsultaCard(especialista: $especialista, parecerMedico: $parecerMedico, dataConsulta: $dataConsulta)
                .frame(height: 270)
            
            List{
                Section(header: Text("Histórico de Consultas")){
                    ForEach(consultaFetch, id: \.self){ consulta in
                        if consulta.pet == pet{
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
                                        Text(consulta.especialista ?? "")
                                            .padding(.top,3)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Data:")
                                            .bold()
                                        Text("\(consulta.dataConsulta ?? Date())")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Parecer médico:")
                                            .bold()
                                        Spacer()
                                    }
                                    HStack{
                                        Text(consulta.parecerMedico ?? "")
                                        Spacer()
                                    }
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
                    consultaViewModel.dataConsulta = dataConsulta
                    consultaViewModel.especialista = especialista
                    consultaViewModel.parecerMedico = parecerMedico
                    consultaViewModel.pet = pet
                    
                    consultaViewModel.addItem(vc: viewContext)
                    print("Salvar")
                }label: {
                    Label("Salvar", systemImage: "")
                        .tint(.blue)
                }
            })
        })
    }
}

//#Preview {
//    ConsultaView()
//}
