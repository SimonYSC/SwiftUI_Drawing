//
//  ContentView.swift
//  Drawing
//
//  Created by YunShou Chao on 8/9/21.
//

import SwiftUI

//struct Flower: Shape {
//    var petalOffset: Double = -20
//    var petalWidth: Double = 100
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
//            let rotation = CGAffineTransform(rotationAngle: number)
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//
//            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
//            let rotatedPetal = originalPetal.applying(position)
//
//            path.addPath(rotatedPetal)
//        }
//
//        return path
//    }
//}

//struct ColorCyclingCircle: View {
//    var amount = 0.0
//    var steps = 100
//
//    var body: some View {
//        ZStack {
//            ForEach(0..<steps) { value in
//                Circle()
//                    .inset(by: CGFloat(value))
//                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
//                        self.color(for: value, brightness: 1),
//                        self.color(for: value, brightness: 0.5)
//                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
//            }
//        }
//        .drawingGroup()
//    }
//
//    func color(for value: Int, brightness: Double) -> Color {
//        var targetHue = Double(value) / Double(self.steps) + self.amount
//
//        if targetHue > 1 {
//            targetHue -= 1
//        }
//
//        return Color(hue: targetHue, saturation: 1, brightness: brightness)
//    }
//}

//struct CheckerBoard: Shape {
//    var rows: Int
//    var columns: Int
//    var animatableData: AnimatablePair<Double, Double> {
//        get {
//            AnimatablePair(Double(rows), Double(columns))
//        }
//        set {
//            self.rows = Int(newValue.first)
//            self.columns = Int(newValue.second)
//        }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        let rowSize = rect.height / CGFloat(rows)
//        let columnSize = rect.width / CGFloat(columns)
//
//        for row in 0..<rows {
//            for column in 0..<columns {
//                if (row + column).isMultiple(of: 2) {
//                    let startX = columnSize * CGFloat(column)
//                    let startY = rowSize * CGFloat(row)
//
//                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
//                    path.addRect(rect)
//                }
//            }
//        }
//
//        return path
//    }
//}

struct Arrow: Shape {
    var thickness: CGFloat = 100
    var animatableData: CGFloat {
        get { thickness }
        set { self.thickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // triangle
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        // rectangle
        let startX: CGFloat = rect.minX + (rect.width - thickness) / 2
        let startY: CGFloat = rect.midY
        path.addRect(CGRect(x: startX, y: startY, width: thickness, height: rect.height / 2))
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
//    @State private var amount: CGFloat = 0.0
//    @State private var rows = 4
//    @State private var columns = 4
    @State private var colorCycle = 0.0
//    @State private var thickness: CGFloat = 50
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: self.colorCycle)
                .frame(width: 200, height: 300)

            Slider(value: $colorCycle)
        }
        
//        Arrow(thickness: thickness)
//            .frame(width: 300, height: 300)
//            .onTapGesture {
//                withAnimation {
//                    self.thickness += 10
//                }
//            }
        
//        CheckerBoard(rows: rows, columns: columns)
//            .onTapGesture {
//                withAnimation(.linear(duration: 3)) {
//                    self.rows = 8
//                    self.columns = 16
//                }
//            }
        
//        VStack {
//            ColorCyclingCircle(amount: self.colorCycle)
//                .frame(width: 300, height: 300)
//
//            Slider(value: $colorCycle)
//        }
        
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//
//            Slider(value: $amount)
//                .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black)
//        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
