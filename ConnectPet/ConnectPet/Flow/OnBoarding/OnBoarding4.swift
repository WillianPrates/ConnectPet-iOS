
import SwiftUI

struct OnBoarding4: View {
    @Binding var onboarding: Bool
    @State var nomeTutor: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("Olá tutor! 😄")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 16)
                
                Text("Para você ter uma melhor experiência gostaríamos de saber")
                    .font(.system(size: 20))
                    .padding(.bottom, 32)
                
                Text("Como você gostaria de ser chamado?")
                    .font(.system(size: 16, weight: .bold))
                
                TextField("Seu nome", text: $nomeTutor)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 336, height: 56)
            }
            
            Spacer()
            
            Button(action: {
                self.onboarding = false
                UserDefaults.standard.set(false, forKey: "firstTimeHere")
            }, label: {
                VStack {
                    Text("Salvar")
                        .font(.system(size: 20, weight: .semibold))
                }
                .foregroundStyle(.white)
                .frame(width: 234, height: 62)
                .background(.corBotao)
                .cornerRadius(20)
            })
            .padding(.bottom, 60)
        }
        .padding(.horizontal)
        .onDisappear {
            UserDefaults.standard.set(nomeTutor, forKey: "nomeTutor")
        }
    }
}
