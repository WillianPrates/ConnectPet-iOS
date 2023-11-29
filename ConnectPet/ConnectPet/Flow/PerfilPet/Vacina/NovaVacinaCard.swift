//
//  NovaVacinaCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 27/11/23.
//

import SwiftUI
//struct FakeVacina: Identifiable, Hashable {
//    var id = UUID()
//    var descricaoVacina: String
//    var idadeIndicada: Int
//    var nomeVacina: String
//    var tipoAnimal: String
//    var dataVacina: String
//}

struct NovaVacinaCard: View {
    
    @ObservedObject var vacinaViewModel: VacinaViewModel

    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()
    
    var body: some View {
        VStack{
            List{Section(header: Text("Adicionar Nova Vacina")){
                HStack {
                    Text("Nome da Vacina")
                        .bold()
                    Spacer()
                    TextField("Nome da Vacina", text: $vacinaViewModel.nome)
                }
                HStack {
                    Text("Descrição:")
                        .bold()
                    TextField("Descrição da Vacina", text: $vacinaViewModel.descricaoVacina)
                }
                HStack {
                    DatePicker("Data de vacina", selection: $vacinaViewModel.dataVacina, displayedComponents: .date)
                }
                HStack {
                    Text("Tipo Animal")
                        .bold()
                    TextField("Tipo Animal", text: $vacinaViewModel.tipoAnimal)
                }
            }
            .listRowBackground(Color.white)
            }
        }
    }
}

//#Preview {
//    VStack {
//        NovaVacinaCard()
//        Text("Teste")
//    }
//}
