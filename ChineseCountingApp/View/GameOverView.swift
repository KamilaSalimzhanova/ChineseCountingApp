//
//  GameOver.swift
//  ChineseCountingApp
//
//  Created by kamila on 28.03.2025.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var gvm: GameViewModel
    let color: Color
    let bgColor: Color
    var body: some View {
        ZStack {
            Image("image1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.8)
            VStack {
                VStack {
                    Text("Game is over!")
                    Text("You solved \(gvm.gameModel.score) out of \(gvm.gameModel.maxTurns)")
                    Text("Click for a new game").fontWeight(.thin)
                }
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 5))
            }
            Spacer()
        }
        .onTapGesture {
            gvm.gameModel.resetGame()
        }
    }
}

struct GameOver_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(color: .white, bgColor: .green).environmentObject(GameViewModel())
    }
}
