import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ListaPetView()
                .tabItem { Label("Pets", systemImage: "pawprint.fill")}
            FeedView()
                .tabItem { Label("Feed", systemImage: "list.bullet")}
            CadastroPetView()
                .tabItem { Label("Perfil", systemImage: "person.fill")}
        }
        .tint(.purpleButtonTab)
    }
}

#Preview {
    TabBarView()
}
