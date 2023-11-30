import SwiftUI

enum DestinationType {
    case examesList, vacinasList, medicamentosList, consultaList, cicloParte1List
}

struct PerfilPetView: View {
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    let buttonsData: [(systemName: String, title: String, color: Color, destination: DestinationType)] = [
        ("pencil.and.list.clipboard", "Exames", .blue, .examesList),
        ("syringe", "Vacinas", .green, .vacinasList),
        ("pills", "Medicamentos", .red, .medicamentosList),
        ("heart.text.square", "Consultas", .orange, .consultaList),
        ("cat", "Ciclo estral", .pink, .cicloParte1List)
    ]
    
    let pet: Pet
    @State private var showingAlertDelete = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    //Exames, vacinas, medicamentos e consultas
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    Image("Gatinho")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 175)
                        .clipShape(Circle())
                    
                    Text(pet.nomePet ?? "")
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAlertDelete.toggle()
                    }) {
                        Image(systemName: "eraser.line.dashed")
                            .foregroundColor(.black)
                    }
                }
            }
            .alert("Tem certeza que deseja excluir os dados do seu pet?", isPresented: $showingAlertDelete) {
                Button("Sim", role: .destructive) {
                    viewContext.delete(pet)
                    dismiss()
                    //acao de excluir
                    
                }
                Button("Não", role: .cancel) {}
            } message: {
                Text("Essa ação não poderá ser desfeita")
            }
        }
    }
    
    func destinationView(for destination: DestinationType) -> some View {
        switch (destination){
        case .examesList:
            return AnyView(ExameView())
        case .vacinasList:
            return AnyView(VacinaView(pet: pet))
        case .medicamentosList:
            return AnyView(MedicamentoView())
        case .consultaList:
            return AnyView(ConsultaView(pet: pet))
        case .cicloParte1List:
            return AnyView(ContentView())
        }
    }
}



