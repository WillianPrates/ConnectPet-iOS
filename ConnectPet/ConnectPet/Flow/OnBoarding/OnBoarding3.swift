//
//  OnBoarding3.swift
//  ConnectPet
//
//  Created by Foundastion03 on 29/11/23.
//

import SwiftUI

struct OnBoarding3: View {
    var body: some View {
        VStack {
            Image("3")
                .resizable()
                .scaledToFill()
                .frame(width: 281, height: 399)
            Text("Compartilhe o histórico do seu pet com qualquer pessoa")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.corTexto)
                .frame(width: 250)
        }
    }
}

#Preview {
    OnBoarding3()
}
