
import SwiftUI

struct OnBoarding1: View {
    var body: some View {
        VStack {
            Image("1")
                .resizable()
                .scaledToFill()
                .frame(width: 281, height: 399)
            Text("Cadastre seu pet para uma jornada de cuidados personalizados")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.corTexto)
                .frame(width: 250)
        }
    }
}
