//
//  BackgroundView.swift
//  iExpense
//
//  Created by Saverio Negro on 30/11/24.
//

import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        GeometryReader { geometry in
            
            let yTop = geometry.size.height * UnitPoint.top.y
            let yCenter = geometry.size.height * UnitPoint.center.y
            let yBottom = geometry.size.height * UnitPoint.bottom.y
            
            ZStack {
                Circle()
                    .fill(.cyan)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height / 1.2)
                    .position(x: geometry.size.width / 2, y: yBottom)
                Circle()
                    .fill(.blue)
                    .scaledToFill()
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 1.45)
                    .position(x: geometry.size.width / 2, y: yCenter)
                Circle()
                    .fill(.indigo)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height / 1.2)
                    .position(x: geometry.size.width / 2, y: yTop)
            }
        }
    }
}

#Preview {
    BackgroundView()
}
