//
//  ConsultaViewModel.swift
//  ConnectPet
//
//  Created by Foundastion03 on 30/11/23.
//

import SwiftUI
import CoreData

class ConsultaViewModel: ObservableObject {
    // MARK: - Fetch
    
    @Published var id = UUID()
    @Published var especialista: String = ""
    @Published var parecerMedico: String = ""
    @Published var dataConsulta: Date = Date()
    @Published var pet: Pet = Pet()
    
    func addItem(vc: NSManagedObjectContext) {
        // withAnimation {
        
        let newConsulta = Consulta(context: vc)
        newConsulta.especialista = especialista
        newConsulta.parecerMedico = parecerMedico
        newConsulta.dataConsulta = dataConsulta
        newConsulta.pet = pet
        
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
