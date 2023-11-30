//
//  NovaConsultaCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI

struct NovaConsultaCard: View {
    @Binding var especialista: String
    @Binding var parecerMedico: String
    @Binding var dataConsulta: Date
    
    var body: some View {
        List {
            Section(header: Text("Adicionar Nova Consulta")) {
            HStack {
                Text("Especialista:")
                    .bold()
                Spacer()
                TextField("Nome do Especialista", text: $especialista)
            }
            HStack {
                Text("Data de consulta")
                    .frame(maxWidth: 145, alignment: .leading)
                    .multilineTextAlignment(.leading)
                DatePicker("", selection: $dataConsulta, displayedComponents: .date)
            }
            VStack {
                HStack {
                    Text("Parecer médico:")
                        .bold()
                    Spacer()
                }
                VStack {
                    MultilineTextView(text: $parecerMedico)
                        .frame(height: 80)
                    Spacer()
                }
            }
            }
            
        .listRowBackground(Color.white)
        }
    }
}

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.systemFont(ofSize: 17.0)
    }
}
