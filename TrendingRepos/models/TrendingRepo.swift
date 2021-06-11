//
//  TrendingRepo.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/8/21.
//

import Foundation

struct TrendingRepo {
    var repositoryName: String
    var repositoryDescription: String
    var numberOfStars: Float
    
    init(json: JSON) {
        self.repositoryName = json["login"].stringValue
        self.repositoryDescription = json["avatar_url"].stringValue
        self.numberOfStars = json["avatar_url"].floatValue
    }
}
