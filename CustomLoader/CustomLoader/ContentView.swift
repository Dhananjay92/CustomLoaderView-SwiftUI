//
//  ContentView.swift
//  CustomLoader
//
//  Created by Intuz on 22/12/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Button Tapped")
                LoaderManager.shared.showGlobalLoader(animating: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    LoaderManager.shared.showGlobalLoader(animating: false)
                }
            }) {
                Text("Show Loader")
                    .frame(width: 140, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(16)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black.opacity(0.1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
