//
//  VacinaView.swift
//  ConnectPet
//
//  Created by Foundation02 on 27/11/23.
//

import SwiftUI


struct VacinaView: View {
    @Environment(\.managedObjectContext) var viewContext
    
//    @FetchRequest(sortDescriptors: []) var vacinas: FetchedResults<Vacina>
    
    @StateObject var vacinaViewModel: VacinaViewModel = VacinaViewModel()
    
    @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Vacina.id, ascending: true)],
            animation: .default) var vacinas: FetchedResults<Vacina>
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack{
            NovaVacinaCard(vacinaViewModel: vacinaViewModel)
                .frame(height: 220)
            
            List{
                Section(header: Text("Histórico de Vacinas")){
                    ForEach(vacinas, id: \.id){ vacina in
                        HStack{
                            Image(systemName: "syringe")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .foregroundColor(.vacinasList)
                            VStack {
                                HStack {
                                    if let nomeVacina = vacina.nome {
                                        Text(nomeVacina)
                                            .bold()
                                    }
//                                    Spacer()
                                }
                                HStack {
                                    if let dataVacina = vacina.dataVacina {
                                        Text(dataVacina.formatted(
                                            Date.FormatStyle()
                                                .month(.twoDigits)
                                                .day(.twoDigits)
                                                .locale(Locale(identifier: "pt_BR"))
                                        ))
                                    }
//                                    Spacer()
                                }
                                if let descricaoVacina = vacina.descricao {
                                    Text(descricaoVacina)
                                        .bold()
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
                Button {
                    vacinaViewModel.addItem(vc: viewContext)
                    print("Salvar")
                }label: {
                    Label("Salvar", systemImage: "")
                        .tint(.blue)
                        .bold()
                        .padding(.horizontal)
                    
                }
            })
        })
    }
}

//#Preview {
//    NavigationStack {
//        VacinaView()
//    }
//}
