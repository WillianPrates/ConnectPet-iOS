//
//  PerfilView.swift
//  ConnectPet
//
//  Created by Foundation02 on 24/11/23.
//

import SwiftUI

struct PerfilView: View {
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    let buttonsDataPerfil: [(systemName: String, title: String, color: Color)] = [
        ("person", "Meu Perfil", .examesList),
        ("bell", "Notificações", .vacinasList),
        ("dog", "Pets", .medicamentosList),
        ("questionmark.circle", "Ajuda", .consultasAgendadasList),
        ("power", "Sair", .castracaoList)
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image("fotoperfil")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 120,height: 120)
                        .padding(.leading)
                        .padding(.top)
                    VStack{
                        HStack {
                            Text("Anna")
                                .font(.title)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            Spacer()
                        }
                        HStack {
                            Button {
                                print("Função adicionar novo pet")
                            }label: {
                                Label("Trocar Imagem", systemImage: "")
                                    .tint(.white)
                                    .bold()
                                
                        }
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .navigationTitle("Perfil")
                .toolbar {
                    ToolbarItem() {
                        Button {
                            print("")
                        }label: {
                            Label("oi", systemImage: "ellipsis.circle")
                                .foregroundColor(.black)
                    
                        }
                    }
                }
                List {
                    ForEach(buttonsDataPerfil, id: \.systemName) { buttonDataPerfil in
                        NavigationLink(destination: ContentView()) {
                            HStack {
                                Image(systemName: buttonDataPerfil.systemName)
                                    .foregroundColor(buttonDataPerfil.color)
                                    .frame(width: 30, height: 30)
                                
                                Text(buttonDataPerfil.title)
                                    .foregroundColor(.black)
                                    .padding(.leading, 8)
                            }
                        }
                        .padding(.vertical, 3)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(corBackground)
            }
            .background(corBackground)
        }
    }
}

#Preview {
    PerfilView()
}
