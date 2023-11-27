import SwiftUI

struct FeedView: View {
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        Button(action: {
                            print("Botão 1 pressionado!")
                        }, label: {
                            VStack {
                                HStack {
                                    Text("Histórico de Consultas")
                                        .lineLimit(2)
                                        .frame(width: 100)
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                HStack {
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding()
                            .background(Color.vacinas)
                            .cornerRadius(10)
                        })
                        
                        Button(action: {
                            print("Botão 2 pressionado!")
                        }, label: {
                            VStack {
                                HStack {
                                    Text("Cartilha de vacinação")
                                        .lineLimit(2)
                                        .frame(width: 100)
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                HStack {
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding()
                            .background(Color.consultas)
                            .cornerRadius(10)
                        })
                    }
                    
                    HStack {
                        Button(action: {
                            print("Botão 2 pressionado!")
                        }, label: {
                            VStack {
                                HStack {
                                    Text("Resultado de exames")
                                        .lineLimit(2)
                                        .frame(width: 100)
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                HStack {
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding()
                            .background(Color.exames)
                            .cornerRadius(10)
                        })
                        
                        Button(action: {
                            print("Botão 2 pressionado!")
                        }, label: {
                            VStack {
                                HStack {
                                    Text("Medicamentos")
                                        .lineLimit(2)
                                        .frame(width: 100)
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                HStack {
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding()
                            .background(Color.medicamentos)
                            .cornerRadius(10)
                        })
                    }
                }
                .navigationTitle("Feed")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Ação que você deseja realizar
                        }) {
                            Image(systemName: "ellipsis.circle")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
