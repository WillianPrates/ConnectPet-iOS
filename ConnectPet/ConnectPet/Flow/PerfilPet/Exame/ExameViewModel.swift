
import SwiftUI
import CoreData

class ExameViewModel: ObservableObject {
    // MARK: - Fetch
    
    @Published var id = UUID()
    @Published var nomeExame: String = ""
    @Published var descricaoExame: String = ""
    @Published var resultadoExame: String = ""
    @Published var dataExame: Date = Date()
    @Published var pet: Pet = Pet()
    
    func addItem(vc: NSManagedObjectContext) {
        withAnimation {
            
            let newExame = Exame(context: vc)
            newExame.nome = nomeExame
            newExame.descricao = descricaoExame
            newExame.resultado = resultadoExame
            newExame.data = dataExame
            newExame.pet = pet
            
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
    
    func deleteItems(offsets: IndexSet, vc: NSManagedObjectContext, exames: FetchedResults<Exame>) {
        withAnimation {
            offsets.map { exames[$0] }.forEach(vc.delete)
            
            do {
                try vc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
