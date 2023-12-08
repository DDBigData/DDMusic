//
//  Color.swift
//  DDMusic
//
//  Created by 남경민 on 12/8/23.
//

import SwiftUI
 
extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
extension Color {
    static let grey1 = Color(hex: "241D2A")
    static let keyword_bg = Color(hex:"211F1F")
    static let keyword_purple = Color(hex:"7E3FBE")
}

