//
//  RepositoryRequest.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/11/21.
//


import Foundation


enum RepositoryRequest: Request {
    
    
    case repositories
    case trendingRepositoriesInLast30Days
    
    var path: String {
        switch self {
        case .repositories: return "search/repositories?q=order=desc"
        case .trendingRepositoriesInLast30Days:
            return "search/repositories?q=created:>2017-10-22&sort=stars&order=desc"
       
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var params: RequestParams? {
         return nil
    
    }
    
}

