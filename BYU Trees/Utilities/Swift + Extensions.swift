//
//  Swift + Extensions.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 12/5/21.
//

import Foundation
import SwiftSoup

extension String {
    func htmlToMarkup() -> String {
        
        var html = self.replacingOccurrences(of: "<A HREF", with: "<a href")
        html = html.replacingOccurrences(of: "TARGET=", with: "target=")
        html = html.replacingOccurrences(of: "</A>", with: "</a>")
        
        do {
            let doc: Document = try SwiftSoup.parse(html)
            guard let anchors = try? doc.select("A") else { return "error" }
            let elements = anchors.array()
            for anchor in elements {
                let href: String = try anchor.attr("HREF")
                let text: String = try anchor.text()
                let markdown = String(format: "[%@](%@)", text, href)
                let outerHtml = try anchor.outerHtml()
                html = html.replacingOccurrences(of: outerHtml, with: markdown)
            }
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
        
        
        html = html.replacingOccurrences(of: "<B>", with: "**")
        html = html.replacingOccurrences(of: "  </B>", with: "** ")
        html = html.replacingOccurrences(of: " </B>", with: "** ")
        html = html.replacingOccurrences(of: "</B>", with: "**")
        html = html.replacingOccurrences(of: "<I>", with: "*")
        html = html.replacingOccurrences(of: "</I>", with: "*")
        html = html.replacingOccurrences(of: "<br/>", with: "\n")
        html = html.replacingOccurrences(of: "&#39;", with: "’")
        
        return html
    }
}
