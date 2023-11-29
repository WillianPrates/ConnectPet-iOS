import SwiftUI

enum DestinationType {
    case examesList, vacinasList, medicamentosList, consultasAgendadasList, castracaoList, historicoList, cicloParte1List
}

struct PerfilPetView: View {
    
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    let buttonsData: [(systemName: String, title: String, color: Color, destination: DestinationType)] = [
        ("pencil.and.list.clipboard", "Exames", .blue, .examesList),
        ("syringe", "Vacinas", .green, .vacinasList),
        ("pills", "Medicamentos", .red, .medicamentosList),
        ("calendar", "Consultas agendadas", .purple, .consultasAgendadasList),
        ("dog", "Castração", .yellow, .castracaoList),
        ("heart.text.square", "Histórico de consultas", .orange, .historicoList),
        ("cat", "Ciclo estral", .pink, .cicloParte1List)
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
                        NavigationLink(destination: destinationView(for: buttonData.destination)) {
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
    
<<<<<<< Updated upstream
    func destinationView(for destination: DestinationType) -> some View {
        switch (destination){
        case .examesList:
            return AnyView(ContentView())
        case .vacinasList:
            return AnyView(VacinaView())
        case .medicamentosList:
            return AnyView(ContentView())
        case .consultasAgendadasList:
            return AnyView(ContentView())
        case .castracaoList:
            return AnyView(ContentView())
        case .historicoList:
            return AnyView(ContentView())
        case .cicloParte1List:
            return AnyView(ContentView())
        }
    }
=======
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
>>>>>>> Stashed changes
}

//struct PerfilPetView_Previews: PreviewProvider {
//    static var previews: some View {
<<<<<<< Updated upstream
//        PerfilPetView(pet: Pet()))
=======
//        PerfilPetView(pet: Pet())
>>>>>>> Stashed changes
//    }
//}
