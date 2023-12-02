
import SwiftUI

@main
struct ConnectPetApp: App {
    @State var onboarding: Bool = UserDefaults.standard.value(forKey: "firstTimeHere") as? Bool ?? true
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            if onboarding {
                OnboardingView(onboarding: $onboarding)
            } else {
                TabBarView()
            }
        }
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
