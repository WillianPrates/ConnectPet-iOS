//
//  PetCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 21/11/23.
//

import SwiftUI


struct PetCard: View {
    
    var pet: Pet
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(spacing: 1) {
                Image(systemName: "pawprint.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 100)
                        .padding(9)
                Text(pet.nomePet!)
                        .bold()
                        .padding(.horizontal)
                        .foregroundColor(.purple)
                        .lineLimit(1)
                Text(pet.dataNascimento?.description ?? "")
                    .padding(.horizontal)
                    .padding(.top,125)
                    .foregroundColor(.vacinasList)
            }

        }
        //pet.dataNascimento?.description ?? ""
        .background(Color(.white))
        .cornerRadius(16)
        .frame(width: 175,height: 155)
    }
}

#Preview {
    PetCard(pet: Pet())
}

