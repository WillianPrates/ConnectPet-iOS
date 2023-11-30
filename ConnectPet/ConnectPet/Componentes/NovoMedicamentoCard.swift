//
//  NovoMedicamentoCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI
struct FakeMedicamento: Identifiable, Hashable {
    var id = UUID()
    var descricaoMedicamento: String
    var nomeMedicamento: String
    var dataMedicamento: String
    var horarioMedicamento: String
}


struct NovoMedicamentoCard: View {
    @State var medicamento: FakeMedicamento
    
    var body: some View {
            List{Section(header: Text("Adicionar Novo Medicamento")){
                
                HStack {
                    Text("Medicamento:")
                        .bold()
                    Spacer()
                    TextField("Nome do Medicamento", text: $medicamento.nomeMedicamento)
                }
                HStack{
                    Text("Descrição:")
                        .bold()
                    TextField("Descrição:", text: $medicamento.descricaoMedicamento)
                }
                HStack{
                    Text("Data:")
                        .bold()
                    TextField("Data:", text: $medicamento.dataMedicamento)
                }
                HStack {
                    Text ("Horário: ")
                        .bold()
                    Spacer()
                    TextField("Horário:", text: $medicamento.horarioMedicamento)
            }
                }
                
            .listRowBackground(Color.white)
            }
        }
    }


#Preview {
    NovoMedicamentoCard(medicamento: FakeMedicamento(descricaoMedicamento: "Vermífugo X", nomeMedicamento: "Vermífugo", dataMedicamento: "20/11/2023", horarioMedicamento: "20:00"))
}
