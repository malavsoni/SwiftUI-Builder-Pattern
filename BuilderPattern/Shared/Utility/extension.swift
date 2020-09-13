//
//  extension.swift
//  BuilderPattern (iOS)
//
//  Created by Malav Soni on 13/09/20.
//

import Foundation
import SwiftUI

extension Color {
    static var primaryColorGreen:Color { Color("primary_green_dark") }
    static var primaryColorBlue:Color { Color("primary_blue") }
    static var secondaryColor:Color { Color("secondary") }
    static var backgroundColor:Color { Color("background") }
    static var titleColor:Color { Color("title") }
    static var primaryGradient:[Color] { [Color.primaryColorGreen, Color.primaryColorBlue]}
}
