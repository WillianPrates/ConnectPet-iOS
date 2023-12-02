
import SwiftUI
import CoreData

class MedicamentoViewModel: ObservableObject {
    // MARK: - Fetch
    
    @Published var id = UUID()
    @Published var medicamento: String = ""
    @Published var descricao: String = ""
    @Published var data: Date = Date()
    @Published var horario: Date = Date()
    @Published var pet: Pet = Pet()
    
    func addItem(vc: NSManagedObjectContext) {
        withAnimation {
            let newMedicamento = Medicamento(context: vc)
            newMedicamento.nome = medicamento
            newMedicamento.descricao = descricao
            newMedicamento.data = data
            newMedicamento.horario = horario
            newMedicamento.pet = pet
            
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
    
    func deleteItems(offsets: IndexSet, vc: NSManagedObjectContext, medicamentos: FetchedResults<Medicamento>) {
        withAnimation {
            offsets.map { medicamentos[$0] }.forEach(vc.delete)
            
            do {
                try vc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

