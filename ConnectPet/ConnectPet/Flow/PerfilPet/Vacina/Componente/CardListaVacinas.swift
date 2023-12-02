
import SwiftUI

struct CardListaVacinas: View {
    @State var nomeVacina: String
    @State var descricaoVacina: String
    @State var dataVacina: Date
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: "syringe")
                .resizable()
                .frame(width: 25,height: 25)
                .foregroundColor(.vacinasList)
            VStack(alignment: .leading) {
                HStack {
                    Text(nomeVacina)
                        .bold()
                    Spacer()
                    Text(dataVacina.formatted(
                        Date.FormatStyle()
                            .month(.twoDigits)
                            .day(.twoDigits)
                            .locale(Locale(identifier: "pt_BR"))
                    ))
                    .bold()
                }
                Text(descricaoVacina)
                    .lineLimit(2)
                    .font(.system(size: 12))
            }
        }
        .font(.system(size: 16))
        .padding(.leading, 5)
        .padding(.trailing)
        .frame(height: 50)
    }
}
