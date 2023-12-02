
import SwiftUI

struct CastracaoView: View {
    @StateObject private var cadastroPetViewModel: CadastroPetViewModel = CadastroPetViewModel()
    
    let corBackground = LinearGradient(gradient: Gradient(colors: [Color("Gradiente-Purple"), Color("Gradiente-Blue")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View{
        VStack{
            List{
                HStack {
                    VStack {
                        Image(systemName: "dog")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .padding(.horizontal)
                            .padding(.top)
                            .foregroundColor(.castracaoList)
                        Spacer()
                    }
                    
                    VStack{
                        HStack{
                            Toggle("Castrado:", isOn: $cadastroPetViewModel.castrado)
                                .tint(Color("PurpleButtonTab"))
                                .bold()
                        }
                        HStack{
                            if cadastroPetViewModel.castrado == true {
                                Text("Data castração:")
                                    .bold()
                                Text("24/10/2023")
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(corBackground)
    }
}
