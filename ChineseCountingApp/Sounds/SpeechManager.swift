import Foundation
import AVFoundation

final class SpeechManager {
    private let synthesizer = AVSpeechSynthesizer()
    
    static let speechManager = SpeechManager()
    private init() {}
    
    func speekNumber(_ number: Int, volume: Double) {
        let chineseNumbers = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十"]
        guard number >= 0, number < 10 else {
            print("Number out of range")
            return
        }
        speak(text: chineseNumbers[number], language: "zh-CN", volume: volume)
    }
    
    func speakJoy(_ message: String, volume: Double) {
        let joyfulMessages = ["whoop", "bell", "awesome", "correct", "yes"]
        
        guard joyfulMessages.contains(message.lowercased()) else {
            print("Invalid joy message")
            return
        }
        speak(text: message, language: "en-US", volume: volume)
    }
    
    func speakIncorrect(_ message: String, volume: Double) {
        let incorrectMessages = ["oh no", "incorrect answer", "weak"]
        
        guard incorrectMessages.contains(message.lowercased()) else {
            print("Invalid incorrect message")
            return
        }
        
        speak(text: message, language: "en-US", volume: volume)
    }
    
    private func speak(text: String, language: String, volume: Double) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.volume = Float(max(0.0, min(1.0, volume)))
        synthesizer.speak(utterance )
    }
}
