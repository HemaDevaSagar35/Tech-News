//
//  WebView.swift
//  Tech News
//
//  Created by user236150 on 8/16/23.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    
    let url : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrlString = url{
            if let safeUrl = URL(string: safeUrlString){
                let request = URLRequest(url: safeUrl)
                uiView.load(request)
            }
        }
    }
    
}
