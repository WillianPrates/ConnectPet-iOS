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
    
    let pet: Pet
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    //Exames, vacinas, medicamentos e consultas
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Button(action: { }, label: {
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
                    
                    Text(pet.nomePet ?? "") // nome
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(pet.raca ?? "")
                        .foregroundColor(Color("GrayBack"))
                        .font(.title3)
                }
                
                .padding()
                
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
    
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { pet[$0].forEach(viewContext.delete)
//                
//                do {
//                    try viewContext.save()
//                } catch {
//                    // Replace this implementation with code to handle the error appropriately.
//                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                    let nsError = error as NSError
//                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//                }
//            }
//        }
//    }
}

struct PerfilPetView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilPetView(pet: Pet())
    }
}
