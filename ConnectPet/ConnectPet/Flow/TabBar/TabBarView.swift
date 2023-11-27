//
//  TabBarView.swift
//  ConnectPet
//
//  Created by Foundastion03 on 22/11/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ListaPetView()
<<<<<<< Updated upstream
                .tabItem { Label("Pets", systemImage: "pawprint.fill")}
            FeedView()
                .tabItem { Label("Feed", systemImage: "list.bullet")}
=======
                .tabItem { Label("", systemImage: "pawprint.fill")}
            FeedView()
                .tabItem { Label("", systemImage: "list.bullet")}
>>>>>>> Stashed changes
            CadastroPetView()
                .tabItem { Label("Perfil", systemImage: "person.fill")}
        }
        .tint(.purpleButtonTab)
    }
}

#Preview {
    TabBarView()
}
