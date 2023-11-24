//
//  ListaPetView.swift
//  ConnectPet
//
//  Created by Foundation02 on 22/11/23.
//

import SwiftUI

var botao: Bool = false

struct ListaPetView: View {
    
    
    var pets: [FakePet] = [
        FakePet(imageName: "dog", name: "0-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "1-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "2-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "3-Doly", age: "17 anos"),
        FakePet(imageName: "dog", name: "4-Doly", age: "17 anos")
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
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        NavigationStack {
            VStack{
//                HStack {
//                    Image(systemName: "hand.wave")
//                        .resizable()
//                        .frame(width: 20,height: 20)
//                        .padding(.leading)
//                    Text("Hello, Déborah!")
//                        .font(.subheadline)
//                        .bold()
//                        .multilineTextAlignment(.leading)
//                    Spacer()
//                }
                
                ScrollView {
                    if pets.count >= 0 {
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
               // .background(corBackground)

               // .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity)
            .background(corBackground)
            .navigationTitle("Meus Pets")
            .toolbar {
                ToolbarItem() {
                    Button {
                        print("Função adicionar novo pet")
                    }label: {
                        Label("Adicionar Novo Pet", systemImage: "plus.circle")
                            .tint(.black)
                            .frame(width: 175,height: 175)
                            .background(.blueCard)
                            .cornerRadius(16)
                            .font(.headline)
                    }
                }
            }
        }
    }
}


#Preview {
    ListaPetView()
}
