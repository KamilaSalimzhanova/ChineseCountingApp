import Foundation

extension Int {
    static func generateUniqueRandomIntegers(count: Int) -> [Int] {
        guard count < 100 else { return [] }
        var result = [Int]()
        while result.count < count {
            var randInt = Int.random(in: 0...99)
            if !result.contains(randInt) {
                result.append(randInt)
            }
        }
        return result
    }
}
