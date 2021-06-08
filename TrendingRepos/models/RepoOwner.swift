//
//  RepoOwner.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/8/21.
//

import Foundation

struct  RepositoryOwner {
    let repositoryOwnerName: String
    let repositoryOwnerAvatar: String
    let numberOfStars: Int
}

extension RepositoryOwner {
    init(json: JSON) {
      self.repositoryOwnerName = json["name"].stringValue
     
    }
}
