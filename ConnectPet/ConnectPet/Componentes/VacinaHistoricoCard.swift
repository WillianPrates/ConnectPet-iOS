//
//  VacinaHistoricoCard.swift
//  ConnectPet
//
//  Created by Foundation02 on 27/11/23.
//

import SwiftUI

struct VacinaHistoricoCard: View {
   var vacinaHistorico: FakeVacina
    
    var body: some View {
            HStack{
                Image(systemName: "syringe")
                Text(vacinaHistorico.nomeVacina)
                    .bold()
            }
    
        
    }
}

#Preview {
    VacinaHistoricoCard(vacinaHistorico: FakeVacina(descricaoVacina: "oi", idadeIndicada: 9, nomeVacina: "Raiva", tipoAnimal: "cachorro", dataVacina: "10/04/2001"))
}
