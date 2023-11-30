//
//  VacinaViewModel.swift
//  ConnectPet
//
//  Created by Foundastion03 on 28/11/23.
//

import SwiftUI
import CoreData

class VacinaViewModel: ObservableObject {
    // MARK: - Fetch
    
    @Published var id = UUID()
    @Published var descricaoVacina: String = ""
    @Published var idadeIndicada: Date = Date()
    @Published var nome: String = ""
    @Published var tipoAnimal: String = ""
    @Published var dataVacina: Date = Date()
    @Published var pet: Pet = Pet()
    
    func addItem(vc: NSManagedObjectContext) {
        // withAnimation {
        
        let newVacina = Vacina(context: vc)
        newVacina.descricao = descricaoVacina
        newVacina.idadeIndicada = idadeIndicada
        newVacina.nome = nome
        newVacina.tipoAnimal = tipoAnimal
        newVacina.dataVacina = dataVacina
        newVacina.pet = pet
        
        do {
            try vc.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        // }
    }
    
    func deleteItems(offsets: IndexSet, vc: NSManagedObjectContext, vacinas: FetchedResults<Vacina>) {
        withAnimation {
            offsets.map { vacinas[$0] }.forEach(vc.delete)

            do {
                try vc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}
