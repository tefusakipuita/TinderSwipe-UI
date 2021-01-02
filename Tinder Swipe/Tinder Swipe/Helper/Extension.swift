//
//  Extension.swift
//  Tinder Swipe
//
//  Created by 中筋淳朗 on 2020/12/11.
//

import SwiftUI



extension Color {
    
    static let darkPink = Color("darkPink")
    static let lightPink = Color("lightPink")
    
    static let pinkGradient = LinearGradient(
        gradient: Gradient(colors: [Color.darkPink, Color.lightPink]),
        startPoint: .leading,
        endPoint: .trailing)
}


extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

