
import SwiftUI

struct CardNovoExame: View {
    @Binding var nomeExame: String
    @Binding var descricaoExame: String
    @Binding var resultadoExame: String
    @Binding var dataExame: Date

    var body: some View {
        List {
            Section(header: Text("Adicionar Novo Exame")) {
                HStack {
                    Text("Nome do Exame:")
                        .frame(maxWidth: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Nome do exame", text: $nomeExame)
                }
                HStack{
                    Text("Descrição:")
                        .frame(maxWidth: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Descrição do exame", text: $descricaoExame)
                }
                
                HStack {
                    Text ("Resultado: ")
                        .frame(maxWidth: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Resultado do exame", text: $resultadoExame)
                }
                HStack{
                    Text("Data:")
                    DatePicker("", selection: $dataExame, displayedComponents: .date)
                }
            }
            .listRowBackground(Color.white)
        }
        .scrollDisabled(true)
    }
}
