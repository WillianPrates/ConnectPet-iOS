//
//  NovaConsultaCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 28/11/23.
//

import SwiftUI
struct FakeConsulta: Identifiable, Hashable {
    var id = UUID()
    var especialista: String
    var parecerMedico: String
    var dataConsulta: String
}

struct NovaConsultaCard: View {
    @State var consulta: FakeConsulta
    
    var body: some View {
        List{Section(header: Text("Adicionar Nova Consulta")){
            
            HStack {
                Text("Especialista:")
                    .bold()
                Spacer()
                TextField("Nome do Especialista", text: $consulta.especialista)
            }
            HStack{
                Text("Data:")
                    .bold()
                TextField("Data:", text: $consulta.dataConsulta)
            }
            VStack{
                HStack {
                    Text("Parecer médico:")
                        .bold()
                    Spacer()
                }
                VStack {
                    MultilineTextView(text: $consulta.parecerMedico)
                        .frame(height: 80)
                    Spacer()
                }
                
            }
            }
            
        .listRowBackground(Color.white)
        }
    }
}

#Preview {
    NovaConsultaCard(consulta: FakeConsulta(especialista: "Dra. Letícia", parecerMedico: "Tomar medicação três vezes ao dia. Cuidar o comportamento do pet. Retornar se algo acontecer. ", dataConsulta: "22/10/2023"))
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
