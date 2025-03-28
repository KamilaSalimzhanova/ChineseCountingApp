import Foundation

// api/proverbs/random
// https://chinese-proverbs.onrender.com/api/proverbs/random

//{
//   "_id":"63e6ae053bd28e8c186fdf41",
//   "proverb":"身体力行。",
//   "pinyin":"Shēn tǐ lì xíng",
//   "translation":"A body acts according to physical strength."
//}


import Foundation

// MARK: - Welcome
struct ProverbModel: Codable {
    let id, proverb, pinyin, translation: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb, pinyin, translation
    }
    
    static func defaultQuote() -> ProverbModel {
        ProverbModel(id: "63e6ae053bd28e8c186fdf41", proverb: "身体力行。", pinyin: "Shēn tǐ lì xíng", translation: "A body acts according to physical strength.")
    }
}
