//
//  ContentView.swift
//  Shared
//
//  Created by Malav Soni on 13/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel:ContentViewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            // Background Color
            Color.backgroundColor
                .ignoresSafeArea(.all)
            
            // Verticle Container
            VStack(spacing: 40.0) {
                
                // Reusable Component With Builder Pattern
                CircularProgressView(progress: self.$viewModel.progress)
                    .pulseAnimation(true)
                    .titleColor(Color.titleColor)
                    .backgroundColor(Color.backgroundColor)
                    .trackColor(Color.primaryColorGreen)
                    .indicatorColor(Color.primaryColorBlue)
                    .labelVisibility(true)
                    .frame(width: 300, height: 300)
                
                // Slider with progress from ViewModel as Binding
                Slider(value: self.$viewModel.progress, in: 0...1, step: 0.01)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
