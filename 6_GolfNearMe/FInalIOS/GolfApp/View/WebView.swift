//
//  WebView.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/15/22.
//

import SwiftUI

import WebKit

struct MyWebView : UIViewRepresentable{
    
    let request : URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}


struct WebView: View {
    
    var body: some View {
        
        if let url_add = URL(string: "https://www.golfnow.com"){
            MyWebView(request: URLRequest(url: url_add))
        }
    }
}

