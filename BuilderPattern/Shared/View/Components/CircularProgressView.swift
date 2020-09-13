//
//  CircularProgressView.swift
//  BuilderPattern (iOS)
//
//  Created by Malav Soni on 13/09/20.
//

import SwiftUI

struct CircularProgressView: View {
    
    // Required
    @Binding var progress:Double
    
    // Private
    @ObservedObject private var viewModel = CircularProgressViewModel()
    
    // Body View
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                
                // Background Pulse Animation
                if self.viewModel.hasPulseAnimation {
                    PulseIndicatorView(size: geometry.size,lineWidth: 20.0)
                }
                
                // TrackView
                TrackView(backgroundColor: self.viewModel.backgroundColor, trackColor: self.viewModel.trackColor)
                
                // Progress variable Binding with indicator color
                ProgressIndicatorView(progress: self.$progress, progressIndicatorColor: self.viewModel.indicatorColor)
                
                if self.viewModel.shouldShowLabels {
                    // Progress variable Binding with title color
                    ProgressPercentageLabelView(progress: self.$progress, titleColor: self.viewModel.titleColor)
                }
            }
        }).padding(10.0)
    }
    
    //MARK:- Builder Pattern Methods
    func pulseAnimation(_ shouldShowPulseAnimation:Bool) -> CircularProgressView {
        self.viewModel.hasPulseAnimation = shouldShowPulseAnimation
        return self
    }
    
    func labelVisibility(_ visibility:Bool) -> CircularProgressView {
        self.viewModel.shouldShowLabels = visibility
        return self
    }
    
    func trackColor(_ trackColor:Color) -> CircularProgressView {
        self.viewModel.trackColor = trackColor
        return self
    }
    
    func backgroundColor(_ backgroundColor:Color) -> CircularProgressView {
        self.viewModel.backgroundColor = backgroundColor
        return self
    }
    
    func indicatorColor(_ indicatorColor:Color) -> CircularProgressView {
        self.viewModel.indicatorColor = indicatorColor
        return self
    }
    
    func titleColor(_ titleColor:Color) -> CircularProgressView {
        self.viewModel.titleColor = titleColor
        return self
    }
}

//MARK:-
private struct ProgressPercentageLabelView:View {
    
    // Required Variables
    @Binding var progress:Double
    var titleColor:Color
    
    var body: some View {
        Text("\(Int(self.progress * 100))%")
            .font(.largeTitle)
            .foregroundColor(self.titleColor)
            
    }
}
//MARK:-
private struct TrackView:View {
    
    // Required Variables
    var backgroundColor:Color
    var trackColor:Color
    
    // Body View
    var body: some View {
        Circle()
            .fill(self.backgroundColor)
            .overlay(
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(self.trackColor)
            )
            .rotationEffect(.init(degrees: 270))
            .animation(.easeIn)
    }
}
//MARK:-
private struct ProgressIndicatorView:View {
    
    // Required Variables
    @Binding var progress:Double
    var progressIndicatorColor:Color
    
    // Body View
    var body: some View {
        Circle()
            .fill(Color.clear)
            .overlay(
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(1.0, self.progress)))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(self.progressIndicatorColor)
            )
            .rotationEffect(.init(degrees: 270))
            .animation(.easeIn)
    }
}
//MARK:-
private struct PulseIndicatorView: View {
    
    @State private var pulse:Bool = false
    
    // Required Variables
    var size:CGSize
    
    // Variables with default values
    var lineWidth:CGFloat = 20.0
    
    // Body of View
    var body: some View {
        Circle()
            .fill(RadialGradient(gradient: Gradient(colors: Color.primaryGradient), center: .center, startRadius: 0, endRadius: 500))
            .frame(width: size.width - lineWidth, height: size.width - lineWidth)
            .scaleEffect(self.pulse ? 1.5 : 1.0)
            .animation(Animation.easeOut(duration: 1.0).repeatForever(autoreverses: true))
            .onAppear(perform: {
                self.pulse.toggle()
            })
    }
}

//MARK:-
struct CircularProgressView_Previews: PreviewProvider {
    
    @State static private var progress:Double = 0.5
    
    static var previews: some View {
        CircularProgressView(progress: CircularProgressView_Previews.$progress).previewLayout(.sizeThatFits)
    }
}
