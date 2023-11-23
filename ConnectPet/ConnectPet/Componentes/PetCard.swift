//
//  PetCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 21/11/23.
//

import SwiftUI

struct FakePet: Identifiable {
    var id = UUID()
    var imageName: String
    var name: String
    var age: String
}

struct PetCard: View {
    
    var pet: FakePet
    
    var body: some View {
        VStack(alignment: .leading){
          
            Image(pet.imageName)
                .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: -5)
            Text(pet.name)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top,125)
            Text(pet.age)
                .padding(.bottom,8)
                .padding(.horizontal)
        }
        .background(Color("BlueCard"))
        .cornerRadius(16)
        .frame(width: 175,height: 155)
    }
}

#Preview {
    PetCard(pet: FakePet(imageName: "dog", name: "Doly", age: "17 anos"))
}
