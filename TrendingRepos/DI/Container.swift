//
//  Container.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/11/21.
//

import Foundation

class Container {
  
  static let shared: Container = Container.init()
  
  private init() {}
    
}


extension Container {
    
    private func makeClient() -> Dispatcher {
      return WebClient(session: URLSession.init(configuration: .default))
    }
  
    func makeRepositoryViewModel() -> RepositoryViewModel {
      let client = makeClient()
      let repositoryService = RepositoryService(client: client)
      return RepositoryViewModel(service: repositoryService)
    }
}
