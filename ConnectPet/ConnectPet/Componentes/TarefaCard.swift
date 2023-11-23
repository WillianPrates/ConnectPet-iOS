//
//  TarefaCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 23/11/23.
//

import SwiftUI

struct FakeTarefa: Hashable  {
    var petImage: String
    var namePet: String
    var dateTarfea: String
    var nomeTarefa: String
}

struct TarefaCard: View {
    var tarefa: FakeTarefa
    
    init(_ tarefa: FakeTarefa) {
        self.tarefa = tarefa
    }
    
    var body: some View {
        HStack{
            Image(tarefa.petImage)
                .resizable()
                .frame(width: 80, height: 100)
                .clipShape(Circle())
                .padding(.horizontal)
            VStack {
                HStack {
                    Text(tarefa.nomeTarefa)
                        .bold()
                        .font(.headline)
                    Spacer()
                        
                }
                HStack {
                    Text(tarefa.namePet)
                        .font(.headline)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                HStack {
                    Text(tarefa.dateTarfea)
                        .font(.headline)
                    .foregroundStyle(.gray)
                    Spacer()
                }
            }
            
        }
        .background(Color("BlueCard"))
        .cornerRadius(32)
//        .padding(.horizontal)
    }
}

#Preview {
    TarefaCard(FakeTarefa(petImage: "dog", namePet: "Doly", dateTarfea: "25/11/2023", nomeTarefa: "Vacina"))
}
