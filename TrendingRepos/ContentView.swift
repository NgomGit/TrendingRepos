//
//  ContentView.swift
//  TrendingRepos
//
//  Created by Ngom_dxn on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        navigationTitle("Trending Repo")
        
        List(0..<5){item in
            TrendingRepoItem()
                .frame(height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
