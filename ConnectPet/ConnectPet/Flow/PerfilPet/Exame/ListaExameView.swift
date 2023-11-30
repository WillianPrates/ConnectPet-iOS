//
//  ListaExameView.swift
//  ConnectPet
//
//  Created by Foundastion03 on 30/11/23.
//

import SwiftUI

struct ListaExameView: View {
    @State var nomeExame: String
    @State var descricaoExame: String
    @State var resultadoExame: String
    @State var dataExame: Date
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: "pencil.and.list.clipboard")
                .resizable()
                .frame(width: 25,height: 25)
                .foregroundColor(.vacinasList)
            VStack(alignment: .leading) {
                HStack {
                    Text(nomeExame)
                        .bold()
                    Spacer()
                    Text(dataExame.formatted(
                        Date.FormatStyle()
                            .month(.twoDigits)
                            .day(.twoDigits)
                            .locale(Locale(identifier: "pt_BR"))
                    ))
                    .bold()
                }
                Text(resultadoExame)
                    .lineLimit(2)
                    .font(.system(size: 12))
                
                Text(descricaoExame)
                    .lineLimit(2)
                    .font(.system(size: 12))
            }
        }
        .font(.system(size: 16))
        .padding(.leading, 5)
        .padding(.trailing)
        .frame(height: 80)
    }
}

