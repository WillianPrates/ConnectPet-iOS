
import SwiftUI

struct OnboardingView: View {
    @Binding var onboarding: Bool
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        NavigationStack {
            TabView(){
                OnBoarding1()
                    .tag(0)
                
                OnBoarding2()
                    .tag(1)
                
                OnBoarding4(onboarding: $onboarding)
                    .tag(2)
            }
            .background(corBackground)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}
