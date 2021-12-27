//
//  ActivityIndicatorView.swift
//  CustomLoader
//
//  Created by Intuz on 23/12/21.
//

import SwiftUI

struct ActivityIndicatorView: View {
    let style = StrokeStyle(lineWidth: 2, lineCap: .round)
    @State var animate = false
    @State var ringColor = Color.gray
    @State var backgroundColor = Color.white
    @State private var offset: CGFloat = .zero
    @State private var scale: CGFloat = 0.1
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 1.0)
                    .stroke(AngularGradient(gradient: .init(colors: [ringColor, self.ringColor.opacity(0.8), self.ringColor.opacity(0.6), self.ringColor.opacity(0.4), self.ringColor.opacity(0.2), self.ringColor.opacity(0.0)]), center: .center), style: style)
                    .rotationEffect(Angle(degrees: animate ? 360 : 0))
                    .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false), value: scale)
                    .frame(width: 40, height: 40, alignment: .center)
            }
            .onAppear(perform: {
                self.animate.toggle()
                self.scale = 1
            })
            .frame(width: 100, height: 100)
            .background(backgroundColor)
            .cornerRadius(10)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black.opacity(0.3))
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
