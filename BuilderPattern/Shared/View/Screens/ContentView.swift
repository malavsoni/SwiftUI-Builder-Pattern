//
//  ContentView.swift
//  Shared
//
//  Created by Malav Soni on 13/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea(.all)
            CircularProgressView()
                .frame(width: 250, height: 250)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
