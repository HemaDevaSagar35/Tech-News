//
//  ContentView.swift
//  Tech News
//
//  Created by user236150 on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
               
            }.navigationTitle("Tech News")
        }
        
        .onAppear(){
            self.networkManager.fetch()
        }
       
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



