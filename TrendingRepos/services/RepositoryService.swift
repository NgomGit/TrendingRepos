//
//  RepositoryService.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/11/21.
//

import Foundation

final class RepositoryService {
    
    private let client: Dispatcher
    
    init(client: Dispatcher = WebClient(session: .shared)) {
        self.client = client
    }
    
    func getTrendingRepositoriesInLast30Days(completion: @escaping (Result<JSON, NetworkError>) -> ()) {
        let request = RepositoryRequest.trendingRepositoriesInLast30Days
        client.execute(request: request, completion: completion)
    }
    
    func getRepositories(completion: @escaping (Result<JSON, NetworkError>) -> ()) {
        let request = RepositoryRequest.repositories
        client.execute(request: request, completion: completion)
    }
    
    
}
