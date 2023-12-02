
import SwiftUI

struct OnBoarding2: View {
    var body: some View {
        VStack {
            Image("2")
                .resizable()
                .scaledToFill()
                .frame(width: 281, height: 399)
            Text("Registre o histórico de saúde do seu pet de forma simples e organizada")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.corTexto)
                .frame(width: 250)
        }
    }
}
