
import SwiftUI

struct PetCard: View {
    @State var especie: String
    @State var nomePet: String
    @State var dataNascimento: Date
    @State var mostrarSheetPerfil: Bool
    @State var pet: Pet
    
    var body: some View {
        VStack {
            ZStack {
                if(especie == "Cachorro") {
                    VStack {
                        Image("cachorroList")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding(.top, -10)
                    }
                    .frame(width: 160, height: 120)
                    .background(.blueDog)
                }
                else {
                    VStack {
                        Image("gatoList")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding(.top, -10)
                    }
                    .frame(width: 160, height: 120)
                    .background(.pinkCat)
                }
            }
            Spacer()
            VStack(spacing: 5) {
                Text(nomePet)
                    .bold()
                    .padding(.horizontal, 5)
                    .foregroundColor(.purple)
                    .lineLimit(1)
                
                Text(dataNascimento.formatted(
                    Date.FormatStyle()
                        .month(.twoDigits)
                        .day(.twoDigits)
                        .year(.twoDigits)
                        .locale(Locale(identifier: "pt_BR"))
                ))
                .font(.system(size: 12))
                .padding(.horizontal)
                .foregroundColor(.vacinasList)
                .padding(.bottom)
            }
        }
        .frame(width: 160, height: 180)
        .background(.white)
        .cornerRadius(16)
        .onTapGesture {
            mostrarSheetPerfil.toggle()
        }
        .sheet(isPresented: $mostrarSheetPerfil, content: {
            PerfilPetView(pet: pet)
        })
    }
}
