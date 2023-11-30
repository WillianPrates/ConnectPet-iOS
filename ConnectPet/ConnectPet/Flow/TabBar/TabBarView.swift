import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ListaPetView()
                .tabItem { Label("Pets", systemImage: "pawprint.fill")}
            FeedView()
                .tabItem { Label("Feed", systemImage: "list.bullet")}
            PerfilView()
                .tabItem { Label("Perfil", systemImage: "person.fill")}
        }
        .tint(.black)
        .onAppear {
            UITabBar.appearance().backgroundColor = .systemBackground
        }
    }
}
