//
//  NovoExameCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI
struct FakeExame: Identifiable, Hashable {
    var id = UUID()
    var descricaoExame: String
    var resultadoExame: String
    var nomeExame: String
    var dataExame: String
}

struct NovoExameCard: View {
    @State var exame: FakeExame
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NovoExameCard()
}
