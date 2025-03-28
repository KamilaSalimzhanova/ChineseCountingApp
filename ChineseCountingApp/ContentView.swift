//
//  ContentView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingPinyan = true
    @EnvironmentObject var gvm: GameViewModel
    var body: some View {
        NavigationStack {
            VStack {
                ScoreView(score: gvm.gameModel.score, maxTurns: gvm.gameModel.maxTurns)
                    .padding()
                PinyanView(showPinyanView: $isShowingPinyan)
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: GearIconView()) {
                        Image(systemName: "gearshape")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("Chinese Counting")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameViewModel())
    }
}
