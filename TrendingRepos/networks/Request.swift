//
//  File.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/11/21.
//

import Foundation

public protocol Request {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var params: RequestParams? { get }
    var headers: [String: String]? { get }
    
}
