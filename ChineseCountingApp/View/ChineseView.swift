//
//  ChineseView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct ChineseView: View {
    let answer: Int
    let showPinyan: Bool
    var body: some View {
        if let chineseNumber = Chinese.num99toChinese(answer) {
            VStack(alignment: .center, spacing: 10) {
                Text(chineseNumber.chinese)
                Text(chineseNumber.pinyin)
                    .opacity(showPinyan ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.3), value: showPinyan)
            }
            .font(.title)
            .fontWeight(.semibold)
            .padding()
        }
    }
}

struct ChineseView_Previews: PreviewProvider {
    static var previews: some View {
        ChineseView(answer: 50, showPinyan: true)
    }
}
