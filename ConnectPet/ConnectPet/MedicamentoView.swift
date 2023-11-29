//
//  MedicamentoView.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI

struct MedicamentoView: View {
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var medicamento: [FakeMedicamento] = [
        FakeMedicamento(descricaoMedicamento: "Vermífugo X", nomeMedicamento: "Vermífugo", dataMedicamento: "20/11/2023", horarioMedicamento: "20:00"),
        FakeMedicamento(descricaoMedicamento: "Vermífugo X", nomeMedicamento: "Vermífugo", dataMedicamento: "19/11/2023", horarioMedicamento: "20:00"),
        FakeMedicamento(descricaoMedicamento: "Vermífugo X", nomeMedicamento: "Vermífugo", dataMedicamento: "18/11/2023", horarioMedicamento: "20:00"),
        ]
    
    var body: some View {
        VStack{
            NovoMedicamentoCard(medicamento: FakeMedicamento(descricaoMedicamento: "", nomeMedicamento: "", dataMedicamento: "", horarioMedicamento: ""))
                .frame(height: 250)

            List{
                Section(header: Text("Histórico de Medicações")){
                    ForEach(medicamento, id: \.self){ medicamento in
                        HStack{
                            HStack{
                                Image(systemName: "pills")
                                    .resizable()
                                    .frame(width: 25,height: 25)
                                    .foregroundColor(.medicamentosList)
                                
                                VStack {
                                    Text(medicamento.nomeMedicamento)
                                        .bold()
                                    Text(medicamento.dataMedicamento)
                                    
                                }
                                
                            }
                            Spacer()
                            VStack {
                                Spacer()
                                Text(medicamento.horarioMedicamento)
                                    .padding(.bottom)
                            }
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        .scrollContentBackground(.hidden)
        .background(corBackground)
        
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
    NavigationStack {
        MedicamentoView()
    }
}
