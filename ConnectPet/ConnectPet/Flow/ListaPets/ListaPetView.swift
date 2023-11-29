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
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(pets, id: \.self) { pet in
                            PetCard(pet: pet)
                        }
                        .background(.orange)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .background(corBackground)
            .navigationTitle("Meus Pets")
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
            
        }
        
    }
}


#Preview {
    ListaPetView()
}
