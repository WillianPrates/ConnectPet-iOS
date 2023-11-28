//
//  NovaVacinaCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 27/11/23.
//

import SwiftUI
struct FakeVacina: Identifiable, Hashable {
    var id = UUID()
    var descricaoVacina: String
    var idadeIndicada: Int
    var nomeVacina: String
    var tipoAnimal: String
    var dataVacina: String
}

struct NovaVacinaCard: View {
    @State var vacina: FakeVacina
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()

    var body: some View {
        VStack{
//
            List{Section(header: Text("Adicionar Nova Vacina")){
                
                HStack {
                    Text("Nome da Vacina")
                        .bold()
                    Spacer()
                    TextField("Nome da Vacina", text: $vacina.nomeVacina)
                }
                HStack{
                    Text("Descrição:")
                        .bold()
                    TextField("Descrição da Vacina", text: $vacina.descricaoVacina)
                }
                
                HStack {
                    Text ("Idade Indicada: ")
                        .bold()
                    Spacer()
                    TextField("", value: $vacina.idadeIndicada, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                        .multilineTextAlignment(.trailing)
                    Text("Anos")
                }
                HStack{
                    Text("Tipo Animal")
                        .bold()
                    TextField("Tipo Animal", text: $vacina.tipoAnimal)
                }
            }.listRowBackground(Color.white)
            }
        }
    }
}

#Preview {
    VStack {
        NovaVacinaCard(vacina: FakeVacina(descricaoVacina: "Raiva description", idadeIndicada: 2, nomeVacina: "Raiva", tipoAnimal: "cachorro", dataVacina: "10/04/2023"))
        Text("Teste")
    }
}
