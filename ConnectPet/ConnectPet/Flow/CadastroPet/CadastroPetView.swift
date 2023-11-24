//
//  CadastroView.swift
//  ConnectPet
//
//  Created by Foundastion03 on 23/11/23.
//

import SwiftUI

struct CadastroPetView: View {
    @StateObject private var cadastroPetViewModel: CadastroPetViewModel = CadastroPetViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()

    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Nome do pet", text: $cadastroPetViewModel.nomePet)
                    HStack {
                        Text ("Peso do pet em kg: ")
                        Spacer()
                        TextField("", value: $cadastroPetViewModel.peso, formatter: numberFormatter)
                            .keyboardType(.decimalPad)
                            .frame(maxWidth: 100)
                            .multilineTextAlignment(.trailing)
                        Text("kg")
                    }
                    Picker("Sexo", selection: $cadastroPetViewModel.sexo) {
                        ForEach(Sexo.allCases) { type in
                            Text(type.title).tag(type)
                        }
                    }
                } header: {
                    ZStack {
                        Image(systemName: "pawprint.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .foregroundStyle(Color("PurpleButtonTab"))
                    }
                    .clipShape(Circle())
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .padding(.vertical, 30)
                }
                .textCase(nil)
                .listRowBackground(Color.white)
                
                
                Section {
                    Toggle("Castrado", isOn: $cadastroPetViewModel.castrado)
                        .tint(Color("PurpleButtonTab"))
                    Picker("Especie do pet", selection: $cadastroPetViewModel.especie) {
                        ForEach(Especie.allCases) { type in
                            Text(type.title).tag(type)
                        }
                    }
                    
                    if cadastroPetViewModel.especie.title == "Cachorro" {
                        Picker("Raça do pet", selection: $cadastroPetViewModel.racaCachorro) {
                            ForEach(RacaCachorro.allCases) { type in
                                Text(type.title).tag(type)
                            }
                        }
                    } else {
                        Picker("Raça do pet", selection: $cadastroPetViewModel.racaGato) {
                            ForEach(RacaGato.allCases) { type in
                                Text(type.title).tag(type)
                            }
                        }
                    }
                    Picker("Pelagem do pet", selection: $cadastroPetViewModel.pelagem) {
                        ForEach(Pelagem.allCases) { type in
                            Text(type.title).tag(type)
                        }
                    }
                }
                
                Section {
                    DatePicker("Data de nascimento", selection: $cadastroPetViewModel.dataNasc, displayedComponents: .date)
                        .tint(Color("PurpleButtonTab"))
                }
                .listRowBackground(Color.white)
            }
            .background(corBackground)
            .scrollContentBackground(.hidden)
            .navigationTitle("Novo pet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancelar")
                            .foregroundStyle(.black)
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        cadastroPetViewModel.addItem(vc: viewContext)
                        dismiss()
                    } label: {
                        Text("Salvar")
                            .foregroundStyle(Color("PurpleButtonTab"))
                    }
                }
            }
        }
    }
}

#Preview {
    CadastroPetView()
}
