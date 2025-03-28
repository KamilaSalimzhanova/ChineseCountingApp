//
//  NumberOptionsView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct NumberOptionsView: View {
    let numbers: [Int]
    let answer: Int
    var body: some View {
        VStack {
            HStack {
                CircleView(value: numbers[0], answer: answer, color: .blue)
                CircleView(value: numbers[1], answer: answer, color: .green)
            }
            .padding(.horizontal)
            HStack {
                CircleView(value: numbers[2], answer: answer, color: .red)
                CircleView(value: numbers[3], answer: answer, color: .orange)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct NumberOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        NumberOptionsView(numbers: [1,2,3,4], answer: 2)
    }
}
