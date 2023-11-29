//
//  NovoExameCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI
struct FakeExame: Identifiable, Hashable {
    var id = UUID()
    var descricaoExame: String
    var resultadoExame: String
    var nomeExame: String
    var dataExame: String
}

struct NovoExameCard: View {
    @State var exame: FakeExame
    
    var body: some View {
        VStack{
            List{Section(header: Text("Adicionar Novo Exame")){
                
                HStack {
                    Text("Nome do Exame")
                        .bold()
                    Spacer()
                    TextField("Nome do Exame", text: $exame.nomeExame)
                }
                HStack{
                    Text("Descrição:")
                        .bold()
                    TextField("Descrição:", text: $exame.descricaoExame)
                }
                
                HStack {
                    Text ("Resultado: ")
                        .bold()
                    Spacer()
                    TextField("Resultado:", text: $exame.resultadoExame)
                }
                HStack{
                    Text("Data:")
                        .bold()
                    TextField("Data:", text: $exame.dataExame)
                }
            }.listRowBackground(Color.white)
            }
        }
    }
}

#Preview {
    NovoExameCard(exame: FakeExame(descricaoExame: "bla bla bla", resultadoExame: "positivo", nomeExame: "Rotina", dataExame: "29/11/2023"))
}

