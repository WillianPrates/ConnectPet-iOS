
import SwiftUI

struct VacinaView: View {
    @State var nomeVacina: String = ""
    @State var descricaoVacina: String = ""
    @State var dataVacina: Date = Date()
    @State var pet: Pet
    @StateObject var vacinaViewModel: VacinaViewModel = VacinaViewModel()
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Vacina.id, ascending: true)],
        animation: .default) private var vacinasFetch: FetchedResults<Vacina>
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack{
            CardNovaVacina(nomeVacina: $nomeVacina, descricaoVacina: $descricaoVacina, dataVacina: $dataVacina)
                .frame(height: 200)
            List{
                if(!vacinasFetch.isEmpty){
                    Section(header: Text("Histórico de Vacinas")){
                        ForEach(vacinasFetch, id: \.self) { vacina in
                            if vacina.pet == pet {
                                CardListaVacinas(nomeVacina: vacina.nome ?? "", descricaoVacina: vacina.descricao ?? "", dataVacina: vacina.dataVacina ?? Date())
                            }
                        }
                        .onDelete(perform: { indexSet in
                            vacinaViewModel.deleteItems(offsets: indexSet, vc: viewContext, vacinas: vacinasFetch)
                        })
                    }
                }
                else{
                    Section(header: Text("")){
                        ForEach(vacinasFetch, id: \.self) { vacina in
                            if vacina.pet == pet {
                                CardListaVacinas(nomeVacina: vacina.nome ?? "", descricaoVacina: vacina.descricao ?? "", dataVacina: vacina.dataVacina ?? Date())
                            }
                        }
                        .onDelete(perform: { indexSet in
                            vacinaViewModel.deleteItems(offsets: indexSet, vc: viewContext, vacinas: vacinasFetch)
                        })
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        .scrollContentBackground(.hidden)
        .background(corBackground)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    vacinaViewModel.nome = nomeVacina
                    vacinaViewModel.descricaoVacina = descricaoVacina
                    vacinaViewModel.dataVacina = dataVacina
                    vacinaViewModel.pet = pet;
                    
                    vacinaViewModel.addItem(vc: viewContext)
                    
                    nomeVacina = ""
                    descricaoVacina = ""
                    dataVacina = Date()
                } label: {
                    Text("Salvar")
                }
            }
        }
    }
}
