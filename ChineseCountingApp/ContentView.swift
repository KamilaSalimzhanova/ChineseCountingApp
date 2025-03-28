//
//  ContentView.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingPinyan = true
    @State private var done: Bool = false
    @EnvironmentObject var gvm: GameViewModel
    
    var gameOver: Bool {
        gvm.gameModel.gameOver
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScoreView(score: gvm.gameModel.score, maxTurns: gvm.gameModel.maxTurns)
                    .padding()
                PinyanView(showPinyanView: $isShowingPinyan)
                Spacer()
                ChineseView(answer: gvm.gameModel.answer, showPinyan: isShowingPinyan)
                Spacer()
                NumberOptionsView(numbers: gvm.gameModel.alternatives, answer: gvm.gameModel.answer)
                    .onChange(of: gvm.gameModel.turns) { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            gvm.gameModel.generateNewProblem()
                            //print("TURN \(gvm.gameModel.turns)")
                        }
                    }
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
            .fullScreenCover(isPresented: $done) {
                GameOverView(color: .white, bgColor: .green)
            }
            .onChange(of: gameOver, perform: { newValue in
                done = gameOver
            })
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
