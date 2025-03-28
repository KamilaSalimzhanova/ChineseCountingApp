import Foundation

struct GameModel {
    let maxTurns: Int
    var score: Int
    var volume: Double
    var turns: Int
    var answer: Int
    var alternatives: [Int]
    var gameWon: Bool {
        turns >= maxTurns
    }
    var gameOver: Bool {
        score < 0 || gameWon
    }
    mutating func increaseScore() {
        score += 1
    }
    mutating func nextTurn() {
        turns += 1
    }
    mutating func generateNewProblem() {
        alternatives = Int.generateUniqueRandomIntegers(count: 4)
        answer = alternatives[3]
        alternatives = alternatives.shuffled()
    }
    static var defaultGameModel: GameModel {
        .init(maxTurns: 5, score: 0, volume: 0.05, turns: 0, answer: 10, alternatives:  Int.generateUniqueRandomIntegers(count: 4))
    }
}
