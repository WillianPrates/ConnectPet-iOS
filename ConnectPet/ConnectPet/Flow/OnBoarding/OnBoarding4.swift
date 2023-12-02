
import SwiftUI

struct OnBoarding4: View {
    @Binding var onboarding: Bool
    @State var nomeTutor: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("Olá amante de pet!")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom, 40)
                
                Text("Para tornar a sua experiência ainda mais personalizada, gostaríamos de te conhecer melhor. 😊")
                    .font(.system(size: 20))
                    .padding(.bottom, 32)
                
                Text("Diga-nos como gostaria de ser chamado:")
                    .font(.system(size: 16, weight: .bold))
                
                TextField("Seu nome", text: $nomeTutor)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 336, height: 56)
                
                if nomeTutor != "" {
                    VStack(spacing: 8) {
                        Text("Perfeito \(nomeTutor)!")
                            .font(.system(size: 20))
                        Text("Agora toque em começar e deixe a magia acontecer! 🌟")
                            .font(.system(size: 18))
                    }
                    .padding(.top)
                    //.padding(.horizontal)
                    .multilineTextAlignment(.center)
                }
            }
            Spacer()
            
            Button(action: {
                self.onboarding = false
                UserDefaults.standard.set(false, forKey: "firstTimeHere")
            }, label: {
                VStack {
                    Text("Começar")
                        .font(.system(size: 20, weight: .semibold))
                }
                .foregroundStyle(.white)
                .frame(width: 234, height: 62)
                .background(.corBotao)
                .cornerRadius(20)
            })
            .disabled(nomeTutor == "")
            .opacity(nomeTutor == "" ? 0.5 : 1.0)
            .padding(.bottom, 60)
        }
        .padding(.horizontal)
        .onDisappear {
            UserDefaults.standard.set(nomeTutor, forKey: "nomeTutor")
        }
    }
}

