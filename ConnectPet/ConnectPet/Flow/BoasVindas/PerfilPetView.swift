import SwiftUI

struct PerfilPetView: View {
    @State private var showingAlertDelete = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    let pet: Pet
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    let buttonsData: [(systemName: String, title: String, color: Color, destination: DestinationType)] = [
        ("pencil.and.list.clipboard", "Exames", .blue, .examesList),
        ("syringe", "Vacinas", .green, .vacinasList),
        ("pills", "Medicamentos", .red, .medicamentosList),
        ("heart.text.square", "Consultas", .orange, .consultaList),
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    if(pet.especie == "Gato") {
                        Image("gatoList")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 175)
                            .clipShape(Circle())
                    } else {
                        Image("cachorroList")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 175)
                            .clipShape(Circle())
                    }
                    
                    Text(pet.nomePet ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
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
                        .padding(.vertical, 6)
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
            return AnyView(ExameView(pet: pet))
        case .vacinasList:
            return AnyView(VacinaView(pet: pet))
        case .medicamentosList:
            return AnyView(MedicamentoView(pet: pet))
        case .consultaList:
            return AnyView(ConsultaView(pet: pet))
        }
    }
}

enum DestinationType {
    case examesList, vacinasList, medicamentosList, consultaList
}
