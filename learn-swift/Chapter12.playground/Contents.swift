import UIKit


// Challenge 1: Grow a Circle
struct Cir {
    var radius = 0.0
    var area: Double {
        get {
            .pi * radius * radius
        }
        set(p){
            radius = p
        }
    }
    mutating func grow(byFactor: Int) {
        area = radius * sqrt(Double(byFactor))
    }
}
var cir = Cir(radius: 5)
cir.grow(byFactor: 3)
print(cir.area)



// Challenge2
let months = ["January", "February", "March",
              "April", "May", "June", "July", "August", "September",
              "October", "November", "December"]
struct SimpleDate {
    var month: String
    var day: Int
    mutating func advance() {
        day += 1
        if month == months[1] && day > 28 {
            day = 1
            month = months[2]
        }
        else if( day > 31) {
            switch month  {
            case months[0],months[2],months[4],months[6],months[7],months[9],months[11] :
                day = 1
                var p : Int = months.firstIndex(of: month)!
                p = (p == 11) ? 0 : p + 1
                month = months[p]
            default:
                <#code#>
            }
        }
    }
}
var date = SimpleDate(month: "December", day: 31)
date.advance()
print(date.month)
print(date.day)



//Challenge 3

struct Math {
    func isOdd(i : Int) -> Bool {
        return !(i % 2 == 0)
    }
    func isEvent(i : Int) -> Bool {
        return i % 2 == 0
    }
}
var math = Math()

print(" Day la so le: \(math.isOdd(i: 10) )")
print(" Day la so chan: \(math.isEvent(i: 10)) ")



// Challenge 4
extension Int {
    static func isOdd(i : Int) -> Bool {
        return !(i % 2 == 0)
    }
    static func isEvent(i : Int) -> Bool {
        return i % 2 == 0
    }
}
print(" Day la so le: \(Int.isOdd(i: 10))")
print(" Day la so chan: \(Int.isEvent(i: 10))")



// Challenge 5
extension Int {
    func primeFactors() {
        print("day la method primeFactors")
    }
}
