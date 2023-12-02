
import SwiftUI

struct OnBoarding2: View {
    var body: some View {
        VStack {
            Image("2")
                .resizable()
                .scaledToFill()
                .frame(width: 281, height: 399)
            Text("Registre as vacinas, medicamentos, exames e consultas do seu pet")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.corTexto)
                .frame(width: 250)
        }
    }
}
