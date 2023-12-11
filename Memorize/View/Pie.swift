//
//  Pie.swift
//  Memorize
//
//  Created by Иван Дроботов on 08.12.2023.
//

import SwiftUI
import CoreGraphics

struct Pie: Shape {
    private let startAngle: Angle = .zero
    private let clockwise = true
    private var endAngle: Angle
    
    init(endAngle: Angle) {
        self.endAngle = endAngle
    }
    
    
    func path(in rect: CGRect) -> Path {
        let endAngle = -endAngle
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        )
        p.addLine(to: center)
        
        
        return p
    }
}


#Preview {
    Pie(endAngle: .radians(.pi/4))
}
