import UIKit


struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Self.highestLevel {
                Self.highestLevel = id
            }
        }
    }
    var height: Double = 10
    var width: Double = 10
    var diagonal: Int {
        return Int((height * height + width * width).squareRoot().rounded())
    }
}
var level = Level(id: 10, boss: "AK",unlocked: true)
level.unlocked = false
level.diagonal



enum WithdrawalResult {
    case success(newBalance: Int)
    case error(message: String)
}
func withdraw(amount: Int) -> WithdrawalResult {
    if amount <= 1000 {
        print("oke")
        return .success(newBalance: 1)
    } else {
        return .error(message: "Not enough money!")
    }
}
