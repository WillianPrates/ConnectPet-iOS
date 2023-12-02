
import SwiftUI

struct CardListaConsulta: View {
    @State var especialista: String
    @State var dataConsulta: Date
    @State var parecerMedico: String
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: "heart.text.square")
                .resizable()
                .frame(width: 25,height: 25)
                .foregroundColor(.historicoList)
                .padding(.top)
            
            VStack {
                HStack {
                    Text("Especialista:")
                        .bold()
                        .padding(.top,3)
                    Text(especialista)
                        .padding(.top,3)
                    Spacer()
                }
                HStack {
                    Text("Data:")
                        .bold()
                    Text(dataConsulta.formatted(
                        Date.FormatStyle()
                            .month(.twoDigits)
                            .day(.twoDigits)
                            .locale(Locale(identifier: "pt_BR"))
                    ))
                    Spacer()
                }
                HStack {
                    Text("Parecer médico:")
                        .bold()
                    Spacer()
                }
                HStack{
                    Text(parecerMedico)
                        .font(.system(size: 12))
                    Spacer()
                }
            }
        }
        .font(.system(size: 16))
        .padding(.leading, 5)
        .padding(.trailing)
    }
}
