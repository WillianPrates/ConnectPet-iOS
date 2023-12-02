
import SwiftUI

struct CartilhaDeVacinaView: View {
    @StateObject var vacinaViewModel: VacinaViewModel = VacinaViewModel()
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Vacina.id, ascending: true)],
        animation: .default) private var vacinasFetch: FetchedResults<Vacina>
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        NavigationStack {
            List {
                if(!vacinasFetch.isEmpty){
                    ForEach(vacinasFetch, id: \.self) { vacina in
                        Section {
                            Text(vacina.pet?.nomePet ?? "")
                                .bold()
                            CardListaVacinas(nomeVacina: vacina.nome ?? "", descricaoVacina: vacina.descricao ?? "", dataVacina: vacina.dataVacina ?? Date())
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(corBackground)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Feed de vacinas")
                        .font(.title3)
                        .bold()
                }
            }
        }
    }
}
