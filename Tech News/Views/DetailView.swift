//
//  DetailView.swift
//  Tech News
//
//  Created by user236150 on 8/16/23.
//

import SwiftUI


struct DetailView: View {
    let url : String?
    var body: some View {
        WebView(url : url)
    }
}



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
