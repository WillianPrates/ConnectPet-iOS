
import SwiftUI

struct ConsultaView: View {
    @State var id = UUID()
    @State var especialista: String = ""
    @State var parecerMedico: String = ""
    @State var dataConsulta: Date = Date()
    @State var pet: Pet
    @StateObject var consultaViewModel: ConsultaViewModel = ConsultaViewModel()
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Consulta.id, ascending: true)],
        animation: .default) private var consultaFetch: FetchedResults<Consulta>
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack{
            CardNovaConsulta(especialista: $especialista, parecerMedico: $parecerMedico, dataConsulta: $dataConsulta)
                .frame(height: 300)
            
            List{
                Section(header: Text("Histórico de Consultas")){
                    ForEach(consultaFetch, id: \.self){ consulta in
                        if consulta.pet == pet {
                            CardListaConsulta(especialista: consulta.especialista ?? "", dataConsulta: consulta.dataConsulta ?? Date(), parecerMedico: consulta.parecerMedico ?? "")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        consultaViewModel.deleteItems(offsets: indexSet, vc: viewContext, consultas: consultaFetch)
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
                    consultaViewModel.dataConsulta = dataConsulta
                    consultaViewModel.especialista = especialista
                    consultaViewModel.parecerMedico = parecerMedico
                    consultaViewModel.pet = pet
                    
                    consultaViewModel.addItem(vc: viewContext)
                    
                    especialista = ""
                    dataConsulta = Date()
                    parecerMedico = ""
                } label: {
                    Text("Salvar")
                }
            }
        }
    }
}
