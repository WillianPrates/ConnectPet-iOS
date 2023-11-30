//
//  OnBoarding1.swift
//  ConnectPet
//
//  Created by Foundastion03 on 29/11/23.
//

import SwiftUI

struct OnBoarding1: View {
    var body: some View {
        VStack {
            Image("1")
                .resizable()
                .scaledToFill()
                .frame(width: 281, height: 399)
            Text("Cadastre seu pet para uma jornada de cuidados personalizados")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.corTexto)
                .frame(width: 250)
        }
    }
}

#Preview {
    OnBoarding1()
}
