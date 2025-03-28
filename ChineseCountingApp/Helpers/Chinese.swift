import Foundation

//class Chinese {
//    static func num99toChinese(_ num: Int) -> (chinese: String, pinyin: String)? {
//        guard num >= 0 && num <= 99 else { return nil }
//        let chineseDigits: [(chinese: String, pinyin: String)] = [
//            ("零", "líng"),  // 0
//            ("一", "yī"),    // 1
//            ("二", "èr"),    // 2
//            ("三", "sān"),   // 3
//            ("四", "sì"),    // 4
//            ("五", "wǔ"),    // 5
//            ("六", "liù"),   // 6
//            ("七", "qī"),    // 7
//            ("八", "bā"),    // 8
//            ("九", "jiǔ"),   // 9
//            ("十", "shí")    // 10
//        ]
//        let chineseDigitsWithoutZero: [(chinese: String, pinyin: String)] = [
//            ("", ""),  // 0
//            ("一", "yī"),    // 1
//            ("二", "èr"),    // 2
//            ("三", "sān"),   // 3
//            ("四", "sì"),    // 4
//            ("五", "wǔ"),    // 5
//            ("六", "liù"),   // 6
//            ("七", "qī"),    // 7
//            ("八", "bā"),    // 8
//            ("九", "jiǔ"),   // 9
//            ("十", "shí")    // 10
//        ]
//        var chineseResult: String
//        var pinyinResult: String
//        
//        switch num {
//        case 0...10:
//            chineseResult = chineseDigits[num].chinese
//            pinyinResult = chineseDigits[num].pinyin
//        case 11...19:
//            chineseResult = "十\(chineseDigits[num%10].chinese)"
//            pinyinResult = "shí \(chineseDigits[num%10].pinyin)"
//        case 20...99:
//            let digit = num % 10
//            let tenth = num / 10
//            chineseResult = "\(chineseDigits[tenth].chinese)十\(chineseDigitsWithoutZero[digit].chinese)"
//            pinyinResult = "\(chineseDigits[tenth].pinyin) shí \(chineseDigitsWithoutZero[digit].pinyin)"
//        default:
//            return nil
//        }
//        pinyinResult = pinyinResult.trimmingCharacters(in: .whitespaces)
//        return (chineseResult, pinyinResult)
//    }
//}
class Chinese {
    static func num99toChinese(_ num: Int) -> (chinese: String, pinyin: String)? {
        guard num >= 0 && num <= 99 else { return nil }
        
        let chineseDigits: [(chinese: String, pinyin: String)] = [
            ("零", "líng"),  ("一", "yī"),  ("二", "èr"),  ("三", "sān"),  ("四", "sì"),
            ("五", "wǔ"),  ("六", "liù"),  ("七", "qī"),  ("八", "bā"),  ("九", "jiǔ"), ("十", "shí")
        ]
        
        let chineseDigitsWithoutZero: [(chinese: String, pinyin: String)] = [
            ("", ""),  ("一", "yī"),  ("二", "èr"),  ("三", "sān"),  ("四", "sì"),
            ("五", "wǔ"),  ("六", "liù"),  ("七", "qī"),  ("八", "bā"),  ("九", "jiǔ")
        ]
        
        var chineseResult: String
        var pinyinResult: String
        
        switch num {
        case 0...10:
            chineseResult = chineseDigits[num].chinese
            pinyinResult = chineseDigits[num].pinyin
        case 11...19:
            chineseResult = "十" + chineseDigitsWithoutZero[num % 10].chinese
            pinyinResult = "shí " + chineseDigitsWithoutZero[num % 10].pinyin
        case 20...99:
            let tens = num / 10
            let ones = num % 10
            chineseResult = chineseDigits[tens].chinese + "十" + chineseDigitsWithoutZero[ones].chinese
            pinyinResult = chineseDigits[tens].pinyin + " shí" + (ones > 0 ? " " + chineseDigitsWithoutZero[ones].pinyin : "")
        default:
            return nil
        }
        
        return (chineseResult, pinyinResult.trimmingCharacters(in: .whitespaces))
    }
}
