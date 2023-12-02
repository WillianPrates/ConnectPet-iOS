
import SwiftUI

struct OnBoarding3: View {
    var body: some View {
        VStack {
            Image("3")
                .resizable()
                .scaledToFill()
                .frame(width: 281, height: 399)
            Text("Dessa forma, você terá sempre à mão o histórico de saúde completo, garantindo um cuidado personalizado e eficiente")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.corTexto)
                .frame(width: 250)
        }
    }
}
