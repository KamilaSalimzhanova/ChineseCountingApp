import Foundation
import AVFoundation

final class SpeechManager {
    private let synthesizer = AVSpeechSynthesizer()
    
    private func speak(text: String, language: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        synthesizer.speak(utterance)
    }
    
    func speekNumber(number: Int) {
        let chineseNumbers = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
        guard number >= 0, number < 10 else {
            print("Number out of range")
            return
        }
        speak(text: chineseNumbers[number], language: "zh-CN")
    }
    
    func speakJoy(_ message: String) {
        let joyfulMessages = ["whoop", "bell", "awesome", "correct", "yes"]
        
        guard joyfulMessages.contains(message.lowercased()) else {
            print("Invalid joy message")
            return
        }
        speak(text: message, language: "en-US")
    }
    
    func speakIncorrect(_ message: String) {
        let incorrectMessages = ["oh no", "incorrect answer", "weak"]
        
        guard incorrectMessages.contains(message.lowercased()) else {
            print("Invalid incorrect message")
            return
        }
        
        speak(text: message, language: "en-US")
    }
}
