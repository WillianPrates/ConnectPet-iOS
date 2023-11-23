//
//  CadastroPetViewModel.swift
//  ConnectPet
//
//  Created by Foundastion03 on 22/11/23.
//

import SwiftUI

class CadastroPetViewModel: ObservableObject {
    
    // MARK: - Fetch
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pet.id, ascending: true)],
        animation: .default) var pets: FetchedResults<Pet>
    
    // MARK: - Publishers
    
    @Published var nomePet: String = ""
    
    // MARK: - Functions
    
    func addItem() {
        withAnimation {
            let newPet = Pet(context: viewContext)
            newPet.nomePet = nomePet
            

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
    
    func deleteItems(offsets: IndexSet) {
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
