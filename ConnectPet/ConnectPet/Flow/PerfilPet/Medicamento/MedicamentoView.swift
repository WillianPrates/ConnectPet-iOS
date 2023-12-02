
import SwiftUI

struct MedicamentoView: View {
    
    @State var nome: String = ""
    @State var data: Date = Date()
    @State var hora: Date = Date()
    @State var descricao: String = ""
    @State var pet: Pet
    @StateObject var medicamentoViewModel: MedicamentoViewModel = MedicamentoViewModel()
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Medicamento.id, ascending: true)],
        animation: .default) private var medicamentoFetch: FetchedResults<Medicamento>
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack{
            CardNovoMedicamento(nomeMedicamento: nome, descricaoMedicamento: descricao, dataMedicamento: data, horarioMedicamento: hora)
                .frame(height: 250)
            
            List{
                Section(header: Text("Histórico de Medicações")){
                    ForEach(medicamentoFetch, id: \.self){ medicamento in
                        if medicamento.pet == pet {
                            CardListaMeciamento(nome: medicamento.nome ?? "", data: medicamento.data ?? Date(), hora: medicamento.horario ?? Date(), descricao: medicamento.descricao ?? "")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        medicamentoViewModel.deleteItems(offsets: indexSet, vc: viewContext, medicamentos: medicamentoFetch)
                    })
                }
            }
            .listStyle(.insetGrouped)
        }
        .scrollContentBackground(.hidden)
        .background(corBackground)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    medicamentoViewModel.medicamento = nome
                    medicamentoViewModel.descricao = descricao
                    medicamentoViewModel.data = data
                    medicamentoViewModel.horario = hora
                    medicamentoViewModel.pet = pet
                    
                    medicamentoViewModel.addItem(vc: viewContext)
                    
                    nome = ""
                    descricao = ""
                    data = Date()
                    hora = Date()
                } label: {
                    Text("Salvar")
                }
            }
        }
    }
}

