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
        ("questionmark.circle", "Ajuda", .consultasAgendadasList),
        ("power", "Sair", .castracaoList)
    ]
    
    @State public var mostrarBiblioteca: Bool = false
    @State private var nomeTutor = UserDefaults.standard.string(forKey: "nomeTutor") ?? "Tutor"
    @AppStorage("perfilUsuario") var fotoPerfilUsuario : Data = .init(count: 0)
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                HStack{
                    
                    if self.fotoPerfilUsuario.count != 0 {
                        Image(uiImage: UIImage(data: self.fotoPerfilUsuario)!)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 90, height: 90)
                           
                            .padding(.top)
                    } else {
                        Button {
                            self.mostrarBiblioteca.toggle()
                        } label: {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 120, height: 120)
                                .padding(.top)
                                .foregroundStyle(.white)
                        }
                       
                    }
                    
                    
                    
                }
                VStack(alignment: .center, spacing: 8) {
                    Text("Olá, \(nomeTutor)!")
                        .font(.system(size: 25, weight: .medium))
                    
                    Button {
                        self.mostrarBiblioteca.toggle()
                    } label: {
                        VStack() {
                            Text("Editar")
                                .bold()
                                .foregroundStyle(.blue)
                                .font(.system(size: 15))
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .padding(.top, 20)
                
                List {
                    ForEach(buttonsDataPerfil, id: \.systemName) { buttonDataPerfil in
                        NavigationStack {
                            HStack {
                                Image(systemName: buttonDataPerfil.systemName)
                                    .foregroundColor(buttonDataPerfil.color)
                                    .frame(width: 30, height: 30)
                                
                                Text(buttonDataPerfil.title)
                                    .foregroundColor(.black)
                                    .padding(.leading, 8)
                            }
                        }.padding(.vertical, 6)

                    }
                }
                .scrollDisabled(true)
                .background(corBackground)
                .scrollContentBackground(.hidden)
                
            }
            .sheet(isPresented: self.$mostrarBiblioteca) {
                PhotoPicker(show: $mostrarBiblioteca, image: self.$fotoPerfilUsuario)
            }
            .navigationTitle("Perfil")
            .background(corBackground)
            .onAppear {
                nomeTutor = UserDefaults.standard.string(forKey: "nomeTutor") ?? "Tutor"
            }
        }
    }
}

#Preview {
    PerfilView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
