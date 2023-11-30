//
//  PetCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 21/11/23.
//

import SwiftUI


struct PetCard: View {
    @State private var mostrarSheetPerfil = false
    var pet: Pet
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(spacing: 1) {
                if(pet.especie == "Cachorro"){
                    Image("cachorroList")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                        .frame(width: 120, height: 100)
                        .padding(9)
                }
                else if(pet.especie == "Gato"){
                    Image("gatoList")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                        .frame(width: 120, height: 100)
                        .padding(9)
                }
                
                
                Text(pet.nomePet ?? "")
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.purple)
                    .lineLimit(1)
                Text(pet.dataNascimento?.description ?? "")
                    .padding(.horizontal)
                    .padding(.top,12)
                    .foregroundColor(.vacinasList)
                    .lineLimit(1)
            }
        }
        .background(Color(.white))
        .onTapGesture {
            mostrarSheetPerfil.toggle()
        }
        .sheet(isPresented: $mostrarSheetPerfil, content: {
            PerfilPetView(pet: pet)
        })
        .cornerRadius(16)
    }
}

#Preview {
    PetCard(pet: Pet())
}


struct PetCard_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        PetCard(pet: Pet(context: persistenceController.container.viewContext))
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}


//ajustar padding perfil view
//ajustar padding perfil pet view
//ajustar contraste dos botoes de voltar e etc...
//ajustar contraste dos botoes da feeed
