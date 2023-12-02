
import SwiftUI

struct CardNovoMedicamento: View {
    @State var nomeMedicamento: String
    @State var descricaoMedicamento: String
    @State var dataMedicamento: Date
    @State var horarioMedicamento: Date
    
    var body: some View {
        List{
            Section(header: Text("Adicionar Novo Medicamento")) {
                HStack {
                    Text("Medicamento:")
                        .frame(maxWidth: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    TextField("Nome", text: $nomeMedicamento)
                }
                HStack{
                    Text("Descrição:")
                        .frame(maxWidth: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    TextField("Descrição", text: $descricaoMedicamento)
                }
                HStack{
                    Text("Data:")
                        .frame(maxWidth: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    DatePicker("", selection: $dataMedicamento, displayedComponents: .date)
                }
                HStack {
                    Text ("Horário: ")
                        .frame(maxWidth: 145, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    DatePicker("", selection: $horarioMedicamento, displayedComponents: .hourAndMinute)
                }
            }
            .listRowBackground(Color.white)
        }
    }
}
