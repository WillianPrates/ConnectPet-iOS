//
//  OnBoarding2.swift
//  ConnectPet
//
//  Created by Foundastion03 on 29/11/23.
//

import SwiftUI

struct OnBoarding2: View {
    var body: some View {
        VStack {
            Image("2")
                .resizable()
                .scaledToFill()
                .frame(width: 281, height: 399)
            Text("Registre o histórico de saúde do seu pet de forma simples e organizada")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.corTexto)
                .frame(width: 250)
        }
    }
}

#Preview {
    OnBoarding2()
}
