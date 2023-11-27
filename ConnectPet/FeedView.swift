import SwiftUI

struct FeedView: View {
    @State private var selectedDate = Date()
    @State private var isAnimated = false

    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
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
                            .opacity(isAnimated ? 1 : 0) // Configura a opacidade inicial

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
                            .opacity(isAnimated ? 1 : 0) // Configura a opacidade inicial

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
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(.green)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            })
                            .opacity(isAnimated ? 1 : 0) // Configura a opacidade inicial
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
                            .opacity(isAnimated ? 1 : 0) // Configura a opacidade inicial

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
                            .opacity(isAnimated ? 1 : 0) // Configura a opacidade inicial
                        }
                    }
                    .padding()
                    .onAppear {
                        // Adiciona animação de fade-in quando a tela aparece
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
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
