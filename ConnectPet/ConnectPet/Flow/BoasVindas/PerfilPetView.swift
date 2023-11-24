import SwiftUI

struct PerfilPetView: View {
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    let buttonsData: [(systemName: String, title: String, color: Color)] = [
        ("pencil.and.list.clipboard", "Exames", .examesList),
        ("syringe", "Vacinas", .vacinasList),
        ("pills", "Medicamentos", .medicamentosList),
        ("calendar", "Consultas agendadas", .consultasAgendadasList),
        ("dog", "Castração", .castracaoList),
        ("heart.text.square", "Histórico de consultas", .historicoList),
        ("cat", "Ciclo estral", .cicloParte1List)
    ]
    
 //Exames, vacinas, medicamentos e consultas
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Button(action: {}, label: {
                    HStack {
                        Spacer()
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.black)
                    }
                })
                .padding()
                
                Divider()
                
                VStack {
                    Image("Gatinho")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 175)
                        .clipShape(Circle())
                    
                    Text("Charlotte") // nome
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Short Hair")
                        .foregroundColor(Color("GrayBack"))
                        .font(.title3)
                }
                
                .padding()
                
//                VStack {
//                    HStack{
//
//                        Text("Informações").bold()
//                            .font(.caption)
//                            .padding()
//                        Spacer()
//                    }
//                    Rectangle()
//                        .frame(width: 355, height: 100)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }

                
               
                    
                
               
                
                
                
                
                List {
                    ForEach(buttonsData, id: \.systemName) { buttonData in
                        NavigationLink(destination: ContentView()) {
                            HStack {
                                Image(systemName: buttonData.systemName)
                                    .foregroundColor(buttonData.color)
                                    .frame(width: 30, height: 30)
                                
                                Text(buttonData.title)
                                    .foregroundColor(.black)
                                    .padding(.leading, 8)
                            }
                        }
                        .padding(.vertical, 3)
                    }
                }
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
            }
            
            .background(corBackground)
            .navigationBarHidden(true)
        }
    }
}

struct PerfilPetView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilPetView()
    }
}
