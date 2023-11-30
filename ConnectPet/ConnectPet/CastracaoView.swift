//
//  CastracaoView.swift
//  ConnectPet
//
//  Created by Foundation02 on 29/11/23.
//

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
        //        .frame(width: 300,height: 30)
        .scrollContentBackground(.hidden)
        .background(corBackground)
    }
}



#Preview {
    NavigationStack {
        CastracaoView()
    }
}
