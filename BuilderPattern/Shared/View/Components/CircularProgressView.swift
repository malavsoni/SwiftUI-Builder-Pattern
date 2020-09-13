//
//  CircularProgressView.swift
//  BuilderPattern (iOS)
//
//  Created by Malav Soni on 13/09/20.
//

import SwiftUI

struct CircularProgressView: View {
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                PulseIndicatorView(size: geometry.size,lineWidth: 20.0)
                TrackView()
                ProgressIndicatorView()
                ProgressPercentageLabelView()
            }
        }).padding(10.0)
    }
}

private struct ProgressPercentageLabelView:View {
    var body: some View {
        Text("23%")
            .font(.largeTitle)
            .foregroundColor(.titleColor)
    }
}

private struct TrackView:View {
    var body: some View {
        Circle()
            .fill(Color.backgroundColor)
            .overlay(
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(Color.secondaryColor)
            )
            .rotationEffect(.init(degrees: 270))
            .animation(.easeIn)
    }
}

private struct ProgressIndicatorView:View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .overlay(
                Circle()
                    .trim(from: 0.0, to: 0.8)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(Color.primaryColorBlue)
            )
            .rotationEffect(.init(degrees: 270))
            .animation(.easeIn)
    }
}

private struct PulseIndicatorView: View {
    
    @State private var pulse:Bool = false
    
    var size:CGSize
    var lineWidth:CGFloat = 20.0
    
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

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView().previewLayout(.sizeThatFits)
    }
}
