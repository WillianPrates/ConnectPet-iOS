
import SwiftUI

struct CardListaMeciamento: View {
    @State var nome: String
    @State var data: Date
    @State var hora: Date
    @State var descricao: String
    
    var body: some View {
        VStack(spacing: 24) {
            HStack(spacing: 24) {
                Image(systemName: "pills")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .foregroundColor(.medicamentosList)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(nome)
                            .bold()
                        Text(data.formatted(
                            Date.FormatStyle()
                                .month(.twoDigits)
                                .day(.twoDigits)
                                .year(.twoDigits)
                                .locale(Locale(identifier: "pt_BR"))
                        ))
                        .bold()
                        
                        Text(descricao)
                            .lineLimit(2)
                            .padding(.trailing)
                            .font(.system(size: 12))
                    }
                    Spacer()
                    Text(hora, style: .time)
                        .padding(.bottom)
                        .bold()
                }
            }
        }
        .font(.system(size: 16))
        .padding(.leading, 5)
        .padding(.trailing)
    }
}
