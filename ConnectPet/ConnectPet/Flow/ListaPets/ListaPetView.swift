//
//  ListaPetView.swift
//  ConnectPet
//
//  Created by Foundation02 on 22/11/23.
//

import SwiftUI

var botao: Bool = false

struct ListaPetView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var nomeTutor = UserDefaults.standard.string(forKey: "nomeTutor") ?? "Tutor"
   
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pet.id, ascending: true)],
        animation: .default)
    
    private var pets: FetchedResults<Pet>
    
    @State private var mostrarSheet = false
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack{
                Divider()
                if(pets.count > 0) {
                    HStack(){
                        Text("Pets Cadastrados:")
                            .bold()
                            .padding()
                            .fontWeight(.light)
                        Spacer()
                        
                    }
                }
                
                if pets.count == 0 {
                    ZStack {

                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 330, height: 150)
                            .foregroundColor(.white)
                            .opacity(0.3)

                        VStack(spacing: 5) {
                            Text("Sem pet cadastrado!")
                                .font(.headline)
                                .foregroundColor(.black)

                            Text("Adicione seu animal de estimação para aproveitar todas as funcionalidades.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .frame(width: 300)
                        }.padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }


                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(pets, id: \.self) { pet in
                            if(pets.count > 0){
                                PetCard(pet: pet)
                            }
                            
                        }
                    }.padding(.top, 25)
                    
                }
            }
            .frame(maxWidth: .infinity)
            .background(corBackground)
            .navigationTitle("Olá, \(nomeTutor) 😃")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        mostrarSheet.toggle()
                    }) {
                        Label("Add Item", systemImage: "plus")
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


#Preview {
    ListaPetView()
}
