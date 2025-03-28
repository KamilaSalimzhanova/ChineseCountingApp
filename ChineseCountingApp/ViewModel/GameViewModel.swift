import Foundation

final class GameViewModel: ObservableObject {
    @Published var gameModel = GameModel.defaultGameModel
    private let speechManager = SpeechManager.speechManager
    
    func randomExpressionOfJoy() {
        speechManager.speakJoy( ["whoop", "bell", "awesome", "correct", "yes"].randomElement() ?? "awesome", volume: gameModel.volume)
    }
    func randomIncorrectAnswer() {
        speechManager.speakIncorrect(["oh no", "incorrect answer", "sorry"].randomElement() ?? "incorrect answer", volume: gameModel.volume)
    }
    
    func playNumber(_ num: Int) {
        speechManager.onSpeechEnd = {
            DispatchQueue.main.async {
                self.gameModel.nextTurn()
            }
        }
        
        switch num {
        case 0...10:
            playDigit(num)
        case 11...19:
            playDigit(10)  // Play "shí"
            playDigit(num % 10) // Play the second digit
        case 20...99:
            let tens = num / 10
            let ones = num % 10
            playDigit(tens)  // Play first digit
            playDigit(10)    // Play "shí"
            if ones != 0 {
                playDigit(ones)  // Play second digit if it's not zero
            }
        default:
            speechManager.speakJoy("bell", volume: gameModel.volume)
        }
    }
    
    private func playDigit(_ num: Int) {
        speechManager.speakNumber(num, volume: gameModel.volume)
    }
}
