//
//  VacinaView.swift
//  ConnectPet
//
//  Created by Foundation02 on 27/11/23.
//

import SwiftUI


struct VacinaView: View {
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var vacinas: [FakeVacina] = [
        FakeVacina(descricaoVacina: "Raiva bla bla bla", idadeIndicada: 2, nomeVacina: "Raiva", tipoAnimal: "Cachorro",dataVacina: "10/04/2023"),
        FakeVacina(descricaoVacina: "bla bla bla", idadeIndicada: 3, nomeVacina: "X", tipoAnimal: "Cachorro", dataVacina: "28/09/2023")
        ]
    
    var body: some View {
        VStack{
            NovaVacinaCard(vacina: FakeVacina(id: UUID(), descricaoVacina: "", idadeIndicada: 0, nomeVacina: "", tipoAnimal: "",dataVacina: ""))
                .frame(height: 220)

            List{
                Section(header: Text("Histórico de Vacinas")){
                ForEach(vacinas, id: \.self){ vacina in
                    HStack{
                        Image(systemName: "syringe")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(.vacinasList)
                           
                        
                        VStack {
                            HStack {
                                Text(vacina.nomeVacina)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                Text(vacina.dataVacina)
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
                Button {
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

#Preview {
    NavigationStack {
        VacinaView()
    }
}
