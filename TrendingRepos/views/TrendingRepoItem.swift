//
//  TrendingRepoItem.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/8/21.
//

import SwiftUI
import RxSwift

struct TrendingRepoItem: View {
    
    let repositoryViewModel = Container.shared.makeRepositoryViewModel()
    
    private func getTrendingReposInLast30Days(){
        
        repositoryViewModel.send(action: .getTrendingRepositoriesInLast30Days()) { response in
            executeInMainThread  {
                switch response {
                    case .success(let json):
                        print("Gxetting the repositories \(json)")
                    
                    case .failure(let error):
                        print("Error while fetching notifications \(error)")
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 13, content: {
            Text("Repository Name")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Repository Description")
                .lineLimit(5)
                .font(.subheadline)
                
                
            HStack(alignment: .center, spacing: 7, content: {
                Image("placeholder-image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                
                Text("repo owner name")
                    .frame(width: 200, height: 40, alignment: .leading)
            
                Image("black_star")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("3.1k")
            })
            .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    }
}

struct TrendingRepoItem_Previews: PreviewProvider {
    static var previews: some View {
        TrendingRepoItem()
    }
}
