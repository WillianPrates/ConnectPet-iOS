//
//  PetCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 21/11/23.
//

import SwiftUI

struct PetCard: View {
    
    let pet: Pet
    
    @State private var mostrarSheetPerfil = false

    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: "pawprint.circle.fill")
                .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 155)
            Text(pet.nomePet!)
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.vacinasList)
                    .lineLimit(1)
            Text(pet.dataNascimento?.description ?? "")
                .padding(.horizontal)
                .foregroundColor(.vacinasList)
                .lineLimit(1)
        }
        .background(Color(.white))
        .cornerRadius(16)
        .onTapGesture {
            mostrarSheetPerfil.toggle()
        }
        .sheet(isPresented: $mostrarSheetPerfil, content: {
            PerfilPetView(pet: pet)
        })
    }
}

#Preview {
    PetCard(pet: Pet())
}
