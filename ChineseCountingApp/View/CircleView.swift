import SwiftUI

struct CircleView: View {
    @EnvironmentObject var gvm: GameViewModel
    let value: Int
    let answer: Int
    let color: Color
    var body: some View {
        ZStack {
            Circle()
                .fill(color.gradient)
                .overlay(Circle().stroke(.white.opacity(0.2), lineWidth: 4))
                .shadow(color: color.opacity(0.5), radius: 15, x: 5, y: 5)
            Text("\(value)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .onTapGesture {
            if value == answer {
                self.gvm.playNumber(answer)
                self.gvm.gameModel.increaseScore()
            } else {
                self.gvm.randomIncorrectAnswer()
            }
           
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(value: 1, answer: 1, color: .red)
            .environmentObject(GameViewModel())
    }
}
