//
//  PinyanView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct PinyanView: View {
    @Binding var showPinyanView: Bool
    var body: some View {
        Toggle(showPinyanView ? "Hide spelled sounds" :  "Show spelled sounds", isOn: $showPinyanView.animation())
            .padding(.horizontal)
            .tint(.black)
            .fontWeight(.semibold)
    }
}

struct PinyanView_Previews: PreviewProvider {
    static var previews: some View {
        PinyanView(showPinyanView: .constant(true))
    }
}
