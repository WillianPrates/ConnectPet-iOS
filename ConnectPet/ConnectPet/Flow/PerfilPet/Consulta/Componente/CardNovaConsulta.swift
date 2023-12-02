
import SwiftUI

struct CardNovaConsulta: View {
    @Binding var especialista: String
    @Binding var parecerMedico: String
    @Binding var dataConsulta: Date
    
    var body: some View {
        List {
            Section(header: Text("Adicionar Nova Consulta")) {
                HStack {
                    Text("Especialista:")
                        .frame(maxWidth: 150, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    TextField("Nome do Especialista", text: $especialista)
                }
                HStack {
                    Text("Data de consulta:")
                        .frame(maxWidth: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    DatePicker("", selection: $dataConsulta, displayedComponents: .date)
                }
                VStack(alignment: .leading) {
                    TextField("Parecer médico", text: $parecerMedico, axis: .vertical)
                        .frame(height: 80, alignment: .topLeading)
                }
            }
            .listRowBackground(Color.white)
        }
        .scrollDisabled(true)
    }
}
