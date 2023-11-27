import SwiftUI

struct FeedView: View {
    @State private var selectedDate = Date()
    @State private var isAnimated = false

    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
<<<<<<< Updated upstream
    
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
=======
    let buttonWidth: CGFloat = 150

    var body: some View {
        NavigationStack {
            ZStack {
                corBackground
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    VStack {
                        // Adicione o DatePicker acima dos botões
                        DatePicker("Selecione uma data para consultar o histórico:", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .opacity(isAnimated ? 1 : 0) 

                        HStack {
                            Button(action: {
                                print("Botão pressionado!")
                            }, label: {
                                VStack {
                                    Text("Cartilha de Vacinação")
                                        .lineLimit(2)
                                        .foregroundColor(.black)
                                        .bold()
                                        .frame(width: buttonWidth)
                                    Image(systemName: "syringe")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(.blue)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            })
                            .opacity(isAnimated ? 1 : 0)

                            Spacer()

                            Button(action: {
                                print("Botão pressionado!")
                            }, label: {
                                VStack {
                                    Text("Histórico de Consultas")
                                        .lineLimit(2)
                                        .foregroundColor(.black)
                                        .bold()
                                        .frame(width: buttonWidth)
>>>>>>> Stashed changes
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
<<<<<<< Updated upstream
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
=======
                                        .foregroundColor(.green)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            })
                            .opacity(isAnimated ? 1 : 0)
                        }

                        HStack {
                            Button(action: {
                                print("Botão pressionado!")
                            }, label: {
                                VStack {
                                    Text("Histórico de Exames")
                                        .lineLimit(2)
                                        .foregroundColor(.black)
                                        .bold()
                                        .frame(width: buttonWidth)
                                    Image(systemName: "pencil.and.list.clipboard")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(.orange)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            })
                            .opacity(isAnimated ? 1 : 0)

                            Spacer()

                            Button(action: {
                                print("Botão pressionado!")
                            }, label: {
                                VStack {
                                    Text("Histórico de Medicações")
                                        .lineLimit(2)
                                        .foregroundColor(.black)
                                        .bold()
                                        .frame(width: buttonWidth)
                                    Image(systemName: "pills")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .foregroundColor(.purple)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            })
                            .opacity(isAnimated ? 1 : 0)
                        }
                    }
                    .padding()
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.5)) {
                            self.isAnimated = true
                        }
                    }
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
>>>>>>> Stashed changes
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
