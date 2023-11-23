//
//  ListaPetView.swift
//  ConnectPet
//
//  Created by Foundation02 on 22/11/23.
//

import SwiftUI

var botao: Bool = false

var tarefa: [TarefaCard] = [
    TarefaCard(FakeTarefa(petImage: "dog", namePet: "Doly", dateTarfea: "25/11/2023", nomeTarefa: "Vacina")),
    TarefaCard(FakeTarefa(petImage: "dog", namePet: "Doly", dateTarfea: "25/11/2023", nomeTarefa: "Vacina")),
    TarefaCard(FakeTarefa(petImage: "dog", namePet: "Doly", dateTarfea: "25/11/2023", nomeTarefa: "Vacina"))
]

struct ListaPetView: View {
    
    var pets: [FakePet] = [
        FakePet(imageName: "dog", name: "0-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "1-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "2-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "3-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "4-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "5-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "6-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "7-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "8-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "9-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "10-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "11-Doly", age: "17 anos")
    ]
    
    var indices: [Int] {
        
        var aux: [Int] = []
        
        for index in pets.indices {
            if index%2 == 1 {
                aux.append(index)
            }
        }
        
        return aux
    }
    
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "hand.wave")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .padding(.leading)
                Text("Hello, Déborah!")
                    .font(.largeTitle)
                .multilineTextAlignment(.leading)
                Spacer()
            }
            HStack {
                Text("Próxima Tarefa")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding(.horizontal)
                Spacer()
            }
            List(tarefa, id: \.tarefa){ tarefa in tarefa
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .frame(height: 250)
            
            HStack {
                Text("Meus Pets")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                .bold()
                .padding(.horizontal)
                Spacer()
            }
                

            ScrollView {
                
                HStack {
                    Button {
                        botao.toggle()
                    } label: {
                        Label("Adicionar Novo Pet", systemImage: "plus.circle")
                            .tint(.black)
                            .frame(width: 175,height: 175)
                            .background(.blueCard)
                            .cornerRadius(16)
                            .font(.headline)
                        
                    }
                    
                    if !pets.isEmpty {
                        PetCard(pet: pets[0])
                    }
                }
                
                if pets.count > 1 {
                    VStack {
                        ForEach(indices, id: \.self) { value in
                            HStack {
                                
                                if value + 1 < pets.count {
                                    PetCard(pet: pets[value])
                                    PetCard(pet: pets[value+1])
                                        .padding(.bottom)
                                        .padding(.top)
                                } else {
                                    PetCard(pet: pets[value])
                                        .padding(.bottom)
                                        .padding(.top)
                                        .padding(.leading)
                                    Spacer()
                                }
                                
                            }
                            
                        }
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    ListaPetView()
}
