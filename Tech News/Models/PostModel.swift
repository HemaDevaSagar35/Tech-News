//
//  PostModel.swift
//  Tech News
//
//  Created by user236150 on 8/16/23.
//

import Foundation


struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    
    var id : String{
        return objectID
    }
    
    let title: String
    let url: String?
    let objectID: String
    let points: Int
}
