//
//  DetailsView.swift
//  Timer bootcamp
//
//  Created by Devasurya on 15/04/24.
//

import Foundation
import SwiftUI
import WebKit

struct webView : UIViewRepresentable {
    let stringValue: String?
    
    func makeUIView(context: Context) -> webView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let stringValue = stringValue {
            if let urlString =  URL(string: stringValue) {
                let request = URLRequest(url: urlString)
                uiView.load(request)
            }
        }
    }
}
