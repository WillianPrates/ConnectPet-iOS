import SwiftUI

struct FeedView: View {
    @State private var selectedDate = Date()
    @State var mostrarCartilhaView: Bool = false
    @State var mostrarHistoricoView: Bool = false
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    let buttonWidth: CGFloat = 150
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .background(Color.white)
                        .cornerRadius(10)
                        .tint(.purpleButtonTab)
                    
                    HStack {
                        Button(action: {
                            mostrarCartilhaView.toggle()
                        }, label: {
                            VStack {
                                Text("Cartilha de Vacinação")
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(width: buttonWidth)
                                Image(systemName: "syringe")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .foregroundColor(.consultasAgendadasList)
                            }
                            .frame(width: 170, height: 110)
                            .background(.laranja)
                            .cornerRadius(10)
                        })
                        Spacer()
                        Button(action: {
                            mostrarHistoricoView.toggle()
                        }, label: {
                            VStack {
                                Text("Histórico de Consultas")
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(width: buttonWidth)
                                Image(systemName: "calendar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundColor(.consultasAgendadasList)
                            }
                            .frame(width: 170, height: 110)
                            .background(.rosa)
                            .cornerRadius(10)
                        })
                    }
                    
                    HStack {
                        Button(action: {
                            print("Botão pressionado!")
                        }, label: {
                            VStack {
                                Text("Histórico de Exames")
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(width: buttonWidth)
                                Image(systemName: "pencil.and.list.clipboard")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundColor(.consultasAgendadasList)
                            }
                            .frame(width: 170, height: 110)
                            .background(.azul)
                            .cornerRadius(10)
                        })
                        Spacer()
                        Button(action: {
                            print("Botão pressionado!")
                        }, label: {
                            VStack {
                                Text("Histórico de Medicações")
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(width: buttonWidth)
                                Image(systemName: "pills")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .foregroundColor(.consultasAgendadasList)
                            }
                            .frame(width: 170, height: 110)
                            .background(.verde)
                            .cornerRadius(10)
                        })
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Feed")
            .background(corBackground)
            .sheet(isPresented: $mostrarCartilhaView, content: {
                CartilhaDeVacinaView()
            })
            .sheet(isPresented: $mostrarHistoricoView, content: {
                HistoricoConsultaView()
            })
        }
    }
}
