import SwiftUI

struct FeedView: View {
    @State private var selectedDate = Date()
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    let buttonWidth: CGFloat = 150
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Adicione o DatePicker acima dos botões
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                        .tint(.purpleButtonTab)
                    
                    HStack {
                        Button(action: {
                            print("Botão pressionado!")
                        }, label: {
                            VStack {
                                Text("Cartilha de Vacinação")
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(width: buttonWidth)
                                Image(systemName: "syringe")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .foregroundColor(.vacinasList)
                            }
                            .frame(width: 180, height: 140)
                            .background(.white)
                            .cornerRadius(10)
                        })
                        
                        
                        Spacer()
                        
                        Button(action: {
                            print("Botão pressionado!")
                        }, label: {
                            VStack {
                                Text("Histórico de Consultas")
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(width: buttonWidth)
                                Image(systemName: "calendar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .foregroundColor(.consultasAgendadasList)
                            }
                            .frame(width: 180, height: 140)
                            .background(.white)
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
                                    .frame(width: 30)
                                    .foregroundColor(.red)
                            }
                            .frame(width: 180, height: 140)
                            .background(.white)
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
                                    .frame(width: 40)
                                    .foregroundColor(.orange)
                            }
                            .frame(width: 180, height: 140)
                            .background(.white)
                            .cornerRadius(10)
                        })
                        
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 8)
                .padding(.bottom, 15)
            }
            .navigationTitle("Feed")
            .background(corBackground)
        
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
