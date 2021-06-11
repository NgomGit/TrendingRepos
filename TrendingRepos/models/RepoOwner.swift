//
//  RepoOwner.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/8/21.
//

import Foundation

struct  RepositoryOwner {
    var repositoryOwnerName: String
    var repositoryOwnerAvatar: String
    
}

extension RepositoryOwner {
    init(json: JSON) {
        self.repositoryOwnerName = json["login"].stringValue
        self.repositoryOwnerAvatar = json["avatar_url"].stringValue
    }
}
