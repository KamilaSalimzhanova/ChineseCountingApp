import Foundation

final class GameViewModel: ObservableObject {
    @Published var gameModel = GameModel.defaultGameModel
    private let speechManager = SpeechManager.speechManager
    
    func randomExpressionOfJoy() {
        speechManager.speakJoy( ["whoop", "bell", "awesome", "correct", "yes"].randomElement() ?? "awesome", volume: gameModel.volume)
    }
    func randomIncorrectAnswer() {
        speechManager.speakIncorrect(["oh no", "incorrect answer", "weak"].randomElement() ?? "incorrect answer", volume: gameModel.volume)
    }
    func playNumber(_ num: Int) {
        switch num {
        case 0...10: playDigit(num)
        case 11...19:
            playDigit(10)
            playDigit(num % 10)
        case 20...99:
            let digit = num%10
            playDigit(num/10)
            playDigit(10)
            if digit != 0 {
                playDigit(digit)
            }
        default: speechManager.speakJoy("bell", volume: gameModel.volume)
        }
    }
    private func playDigit(_ num: Int) {
        if num >= 0 && num <= 10 {
            speechManager.speekNumber(num, volume: gameModel.volume)
        }
    }
//    private func DigitToName(_ num: Int) -> String? {
//        let digitNames = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
//        if num >= 0 && num <= 10 {
//            return digitNames[num]
//        }
//        return nil
//    }
}
