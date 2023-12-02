
import SwiftUI
import CoreData

class CadastroPetViewModel: ObservableObject {
    
    // MARK: - Publishers
    
    @Published var nomePet: String = ""
    @Published var peso: Double = 0
    @Published var dataNasc = Date()
    @Published var castrado: Bool = true
    @Published var especie: Especie = .cachorro
    @Published var pelagem: Pelagem = .curta
    @Published var sexo: Sexo = .femea
    @Published var racaCachorro: RacaCachorro = .semRacaDefinida //fazer verificacao para salvar no banco
    @Published var racaGato: RacaGato = .semRacaDefinida
    
    // MARK: - Functions
    
    func addItem(vc: NSManagedObjectContext) {
        withAnimation {
            let newPet = Pet(context: vc)
            newPet.id = UUID()
            newPet.nomePet = nomePet
            newPet.peso = peso
            newPet.especie = String(especie.title)
            newPet.sexo = sexo.title
            newPet.pelagem = pelagem.title
            newPet.castrado = castrado
            newPet.dataNascimento = dataNasc
            
            if (newPet.especie == "Cachorro"){
                newPet.raca = String(racaCachorro.title)
            } else if (newPet.especie == "Gato"){
                newPet.raca = String(racaGato.title)
            } else {
                newPet.raca = "Indefinido"
            }

            do {
                try vc.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteItems(offsets: IndexSet, vc: NSManagedObjectContext, pets: FetchedResults<Pet>) {
        withAnimation {
            offsets.map { pets[$0] }.forEach(vc.delete)

            do {
                try vc.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
