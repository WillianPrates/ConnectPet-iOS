
import SwiftUI

struct HistoricoConsultaView: View {
    @StateObject var consultaViewModel: ConsultaViewModel = ConsultaViewModel()
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Consulta.id, ascending: true)],
        animation: .default) private var historicoFetch: FetchedResults<Consulta>
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        NavigationStack {
            List {
                if(!historicoFetch.isEmpty){
                    ForEach(historicoFetch, id: \.self) { consulta in
                        Section {
                            Text(consulta.pet?.nomePet ?? "")
                                .bold()
                            CardListaConsulta(especialista: consulta.especialista ?? "", dataConsulta: consulta.dataConsulta ?? Date(), parecerMedico: consulta.parecerMedico ?? "")
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(corBackground)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Feed de consultas")
                        .font(.title3)
                        .bold()
                }
            }
        }
    }
}
