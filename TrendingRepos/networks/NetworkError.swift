//
//  NetworkError.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/11/21.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case noInternetConnexion
    case otherReasons
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnexion: return "Pas de connexion Internet"
        default: return "Erreur"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .noInternetConnexion:
            return "Merci de vérifier votre connexion internet avant d'effecter cette opération."
        default:
            return "Merci de rééssayer plus tard."
        }
    }
    
}
