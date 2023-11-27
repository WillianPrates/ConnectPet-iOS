import SwiftUI

struct FeedView: View {
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    HStack {
                        Button(action: {
                            // Adicione aqui o código para a ação do botão
                            print("Botão pressionado!")
                        }, label: {
                            VStack {
                                HStack {
                                    Text("Cartilha de Vacinação")
                                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .bold()
                                    
                                }
                                HStack {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(.black)
                                    
                                }
                                
                            }.padding()
                            
                                .background(Color.vacinas)
                                .cornerRadius(10)
                            
                            
                        })
                        
                        Button(action: {
                            // Adicione aqui o código para a ação do botão
                            print("Botão pressionado!")
                        }, label: {
                            VStack {
                                HStack {
                                    Text("Histórico de Consultas")
                                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
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
                                
                            }.padding()
                            
                                .background(Color.consultas)
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
