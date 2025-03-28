//
//  ScoreView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    let maxTurns: Int
    var body: some View {
        Text("Score \(score) out of \(maxTurns)")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(LinearGradient(
                colors: [Color.black.opacity(0.6), Color.red, Color.purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .shadow(color: .gray.opacity(0.6), radius: 4, x: 2, y: 2)
            .padding()
            .scaleEffect(1.1)
            .animation(.easeInOut(duration: 0.5), value: score)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 0, maxTurns: 5)
    }
}

