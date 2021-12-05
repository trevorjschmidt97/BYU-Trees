//
//  WebView.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/3/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let html: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
}
