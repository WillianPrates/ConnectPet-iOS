//
//  ContentView.swift
//  ConnectPet
//
//  Created by Foundastion03 on 16/11/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
//    var cachorroTeste: Pet = Pet(nomePet: "Leia", nascimento: "01/12/2021", peso: 10.2, raça: "SRD", vacinas: [], exames: [], consultas: [], vermifugos: [], foto: "Foto de cachorro", castrado: true, genero: "Femea")
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pet.id, ascending: true)],
        animation: .default)
    private var pets: FetchedResults<Pet>
    
    @State private var mostrarSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pets) { pet in
                    NavigationLink {
                        Text("Item at \(pet.nomePet!)")
                    } label: {
                        Text(pet.nomePet!)
                    }
                }
                .onDelete(perform: deleteItems)
            }
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

    private func addItem() {
        withAnimation {
            let newPet = Pet(context: viewContext)
            newPet.nomePet = "Teste 2"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { pets[$0] }.forEach(viewContext.delete)            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
