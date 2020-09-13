//
//  CircularProgressViewModel.swift
//  BuilderPattern
//
//  Created by Malav Soni on 13/09/20.
//

import Foundation
import SwiftUI

// ObservableObject View Model
class CircularProgressViewModel:ObservableObject {
    
    // If the value is true then show the animation view.
    @Published var hasPulseAnimation:Bool = false
    
    @Published var backgroundColor:Color = Color.backgroundColor
    
    @Published var trackColor:Color = Color.primaryColorGreen
    
    @Published var indicatorColor:Color = Color.primaryColorBlue
    
    @Published var titleColor:Color = Color.titleColor
    
    @Published var shouldShowLabels:Bool = true
}
