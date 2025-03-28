import Foundation
import AVFoundation

final class SpeechManager: NSObject, AVSpeechSynthesizerDelegate {
    private let synthesizer = AVSpeechSynthesizer()
    var onSpeechEnd: (() -> Void)?
    
    static let speechManager = SpeechManager()
    
    override init() {
        super.init()
        synthesizer.delegate = self
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        onSpeechEnd?()
    }
    
    func speakNumber(_ number: Int, volume: Double) {
        guard let (chinese, _) = Chinese.num99toChinese(number) else {
            print("Number out of range")
            return
        }
        speak(text: chinese, language: "zh-CN", volume: volume)
    }
    
    func speakJoy(_ message: String, volume: Double) {
        speak(text: message, language: "en-US", volume: volume)
    }
    
    func speakIncorrect(_ message: String, volume: Double) {
        speak(text: message, language: "en-US", volume: volume)
    }
    
    private func speak(text: String, language: String, volume: Double) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.volume = Float(max(0.0, min(1.0, volume)))
        synthesizer.speak(utterance )
    }
}
