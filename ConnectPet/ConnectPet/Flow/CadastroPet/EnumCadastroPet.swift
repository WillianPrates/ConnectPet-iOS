//
//  EnumCadastroPet.swift
//  ConnectPet
//
//  Created by Foundastion03 on 24/11/23.
//

import Foundation

enum Pelagem: String, CaseIterable, Identifiable {
    case curta
    case media
    case longa
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case.curta: return "Curta"
        case.media: return "Média"
        case.longa: return "Longa"
        }
    }
}

enum Especie: String, CaseIterable, Identifiable {
    case cachorro
    case gato
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case.cachorro: return "Cachorro"
        case.gato: return "Gato"
        }
    }
}

enum Sexo: String, CaseIterable, Identifiable {
    case femea
    case macho
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case.femea: return "Fêmea"
        case.macho: return "Macho"
        }
    }
}

enum RacaCachorro: String, CaseIterable, Identifiable {
        case akita
        case beagle
        case boxer
        case chihuahua
        case dachshund
        case doberman
        case frenchBulldog
        case germanShepherd
        case goldenRetriever
        case labradorRetriever
        case maltese
        case pomeranian
        case poodle
        case pug
        case rottweiler
        case saintBernard
        case semRacaDefinida
        case siberianHusky
        case yorkshireTerrier

        var id: Self {
            self
        }

        var title: String {
            switch self {
            case .akita: return "Akita"
            case .beagle: return "Beagle"
            case .boxer: return "Boxer"
            case .chihuahua: return "Chihuahua"
            case .dachshund: return "Dachshund"
            case .doberman: return "Doberman"
            case .frenchBulldog: return "French Bulldog"
            case .germanShepherd: return "German Shepherd"
            case .goldenRetriever: return "Golden Retriever"
            case .labradorRetriever: return "Labrador Retriever"
            case .maltese: return "Maltese"
            case .pomeranian: return "Pomeranian"
            case .poodle: return "Poodle"
            case .pug: return "Pug"
            case .rottweiler: return "Rottweiler"
            case .saintBernard: return "Saint Bernard"
            case .semRacaDefinida: return "Sem Raça Definida"
            case .siberianHusky: return "Siberian Husky"
            case .yorkshireTerrier: return "Yorkshire Terrier"
            }
        }
    }


enum RacaGato: String, CaseIterable, Identifiable {
    case abyssinian
    case bengal
    case birman
    case britishShorthair
    case devonRex
    case maineCoon
    case munchkin
    case norwegianForest
    case oriental
    case persian
    case ragamuffin
    case ragdoll
    case russianBlue
    case scottishFold
    case semRacaDefinida
    case siamese
    case sphynx
    case turkishAngora

    var id: Self {
        self
    }

    var title: String {
        switch self {
        case .abyssinian: return "Abyssinian"
        case .bengal: return "Bengal"
        case .birman: return "Birman"
        case .britishShorthair: return "British Shorthair"
        case .devonRex: return "Devon Rex"
        case .maineCoon: return "Maine Coon"
        case .munchkin: return "Munchkin"
        case .norwegianForest: return "Norwegian Forest"
        case .oriental: return "Oriental"
        case .persian: return "Persian"
        case .ragamuffin: return "Ragamuffin"
        case .ragdoll: return "Ragdoll"
        case .russianBlue: return "Russian Blue"
        case .scottishFold: return "Scottish Fold"
        case .semRacaDefinida: return "Sem Raça Definida"
        case .siamese: return "Siamese"
        case .sphynx: return "Sphynx"
        case .turkishAngora: return "Turkish Angora"
        }
    }
}


