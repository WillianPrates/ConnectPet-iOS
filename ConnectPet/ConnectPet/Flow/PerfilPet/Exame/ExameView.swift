//
//  ExameView.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI

struct ExameView: View {
    @State var nomeExame: String = ""
    @State var descricaoExame: String = ""
    @State var resultadoExame: String = ""
    @State var dataExame: Date = Date()
    @State var pet: Pet
    
    @StateObject var exameViewModel: ExameViewModel = ExameViewModel()
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Exame.id, ascending: true)],
        animation: .default) private var examesFetch: FetchedResults<Exame>
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack{
            NovoExameCard(nomeExame: $nomeExame, descricaoExame: $descricaoExame, resultadoExame: $resultadoExame, dataExame: $dataExame)
                .frame(maxHeight: 250)
            
            List {
                Section(header: Text("Histórico de Exames")){
                    ForEach(examesFetch, id: \.self) { exame in
                        if exame.pet == pet {
                            ListaExameView(nomeExame: exame.nome ?? "", descricaoExame: exame.descricao ?? "", resultadoExame: exame.resultado ?? "", dataExame: exame.data ?? Date())
                        }
                    }
                    .onDelete(perform: { indexSet in
                        exameViewModel.deleteItems(offsets: indexSet, vc: viewContext, exames: examesFetch)
                    })
                }
            }
            .listStyle(.insetGrouped)
        }
        .scrollContentBackground(.hidden)
        .background(corBackground)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                Button {
                    exameViewModel.nomeExame = nomeExame
                    exameViewModel.descricaoExame = descricaoExame
                    exameViewModel.resultadoExame = resultadoExame
                    exameViewModel.dataExame = dataExame
                    exameViewModel.pet = pet
                    
                    exameViewModel.addItem(vc: viewContext)
                    
                    nomeExame = ""
                    descricaoExame = ""
                    resultadoExame = ""
                    dataExame = Date()
                } label: {
                    Label("Salvar", systemImage: "")
                        .tint(.blue)
                        .bold()
                        .padding(.horizontal)
                }
            })
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
