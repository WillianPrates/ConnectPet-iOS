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
            ContentView()
                .tabItem { Label("", systemImage: "pawprint.fill")}
            ContentView()
                .tabItem { Label("", systemImage: "list.bullet")}
            ContentView()
                .tabItem { Label("", systemImage: "person.fill")}
        }
       .tint(.purpleButtonTab)    }
}

#Preview {
    TabBarView()
}
