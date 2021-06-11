//
//  viewModels.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/11/21.
//

import Foundation

final class RepositoryViewModel {
    
    enum Actions {
        case getTrendingRepositoriesInLast30Days
        case getRepositories
    }
    
    private var service: RepositoryService
    
    init(service: RepositoryService) {
        self.service = service
    }
    
    func send(action: Actions, completion: @escaping (Result<JSON, NetworkError>) -> ()) {
        switch action {
        case .getTrendingRepositoriesInLast30Days:
            return service.getTrendingRepositoriesInLast30Days( completion: completion)
            
        case .getRepositories:
            return service.getRepositories(completion: completion)
        }
    }
    
}
