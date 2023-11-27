import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ListaPetView()
                .tabItem { Label("", systemImage: "pawprint.fill")}
            ContentView()
                .tabItem { Label("", systemImage: "list.bullet")}
            CadastroPetView()
                .tabItem { Label("", systemImage: "person.fill")}
        }
        .tint(.purpleButtonTab)
    }
}

#Preview {
    TabBarView()
}
