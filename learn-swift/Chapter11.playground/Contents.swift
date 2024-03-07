import UIKit
import Darwin

//Challenge 1: Ice Cream
struct IceCream {
    lazy var  name : String = "cường"
    lazy var ingredients : [String] = ["oke","Cường","lfok"]
}

//Challenge 2: Car and Fuel Tank
struct FuelTank {
    var level: Double
    var lowFuel = true {
        didSet {
            lowFuel = level < 0.1 ? false : true
        }
    }
    init(level: Double) {
        if level >= 0 && level <= 1 {
            self.level = level
        }
        else {
            self.level = level < 0 ? 0 : 1
        }
    }
    func printLow() {
        print(lowFuel)
    }
    
}
struct Car {
    let make: String
    let color: String
    var fuelTank : FuelTank = FuelTank(level: 10)
}
