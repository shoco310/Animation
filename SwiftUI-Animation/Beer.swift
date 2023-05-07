//
//  Beer.swift
//  SwiftUI-Animation
//
//  Created by satoshoco on 2023/05/07.
//

import SwiftUI

struct Beer: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            BeerJug()
                .frame(width: 300, height: 450)
                .padding()
        }
    }
}

struct BeerJugPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Draw your custom beer jug shape with rounded bottom corners
        path.move(to: CGPoint(x: rect.minX + 0.25 * rect.width, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + 0.25 * rect.width, y: rect.minY + 0.2 * rect.height))
        path.addArc(center: CGPoint(x: rect.minX + 0.25 * rect.width, y: rect.minY + 0.2 * rect.height),
                    radius: 10,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.minX + 0.75 * rect.width, y: rect.minY + 0.2 * rect.height))
        path.addArc(center: CGPoint(x: rect.minX + 0.75 * rect.width, y: rect.minY + 0.2 * rect.height),
                    radius: 10,
                    startAngle: Angle(degrees: 270),
                    endAngle: Angle(degrees: 360),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.minX + 0.75 * rect.width, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + 0.25 * rect.width, y: rect.maxY))

        return path
    }
}

struct Bubble: View {
    let diameter: CGFloat
    let yOffset: CGFloat
    let duration: Double
    @State private var isAnimating = false

    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: diameter, height: diameter)
            .opacity(isAnimating ? 0.0 : 1.0)
            .offset(y: yOffset)
            .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: isAnimating)
            .onAppear {
                isAnimating = true
            }
    }
}

struct BeerJug: View {
    let numberOfBubbles = 100

    var body: some View {
        ZStack {
            // Background color
            Color.black.edgesIgnoringSafeArea(.all)

            // Beer jug artwork
            BeerJugPath()
                .fill(Color.orange)
                .frame(width: 300, height: 450)

            // Beer foam
            ForEach(0..<numberOfBubbles, id: \.self) { index in
                Bubble(diameter: CGFloat.random(in: 6...18),
                       yOffset: CGFloat.random(in: -150...150),
                       duration: Double.random(in: 1...3))
                    .position(x: CGFloat.random(in: 90...210), y: CGFloat.random(in: 30...150))
            }
        }
    }
}

struct Beer_Previews: PreviewProvider {
    static var previews: some View {
        Beer()
    }
}
