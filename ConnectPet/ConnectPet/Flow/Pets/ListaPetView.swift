
import SwiftUI

var botao: Bool = false

struct ListaPetView: View {
    @State private var mostrarSheet = false
    @State private var mostrarSheetPerfil = false
    @State private var nomeTutor = UserDefaults.standard.string(forKey: "nomeTutor") ?? "Tutor"
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pet.id, ascending: true)],
        animation: .default) private var pets: FetchedResults<Pet>
    @Environment(\.managedObjectContext) private var viewContext
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                if pets.count == 0 {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 330, height: 150)
                            .foregroundColor(.white)
                            .opacity(0.3)
                        
                        VStack(spacing: 8) {
                            Text("Sem pet cadastrado!")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text("Adicione seu animal de estimação para aproveitar todas as funcionalidades.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .frame(width: 300)
                        }
                    }
                    .onTapGesture {
                        mostrarSheet.toggle()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else {
                    ScrollView {
                        HStack {
                            Text("Pets Cadastrados:")
                                .bold()
                                .padding(.vertical, 5)
                                .fontWeight(.light)
                            Spacer()
                        }
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(pets, id: \.self) { pet in
                                if(pets.count > 0){
                                    PetCard(especie: pet.especie ?? "", nomePet: pet.nomePet ?? "", dataNascimento: pet.dataNascimento ?? Date(), mostrarSheetPerfil: mostrarSheetPerfil, pet: pet)
                                }
                            }
                        }
                        .padding(.top, 5)
                    }
                }
            }
            .padding(.horizontal)
            .scrollIndicators(.hidden)
            .frame(maxWidth: .infinity)
            .background(corBackground)
            .navigationTitle("Olá, \(nomeTutor)!")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        mostrarSheet.toggle()
                    }) {
                        Image("plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarSheet, content: {
                CadastroPetView()
            })
            .onAppear {
                nomeTutor = UserDefaults.standard.string(forKey: "nomeTutor") ?? "Tutor"
            }
        }
    }
}
