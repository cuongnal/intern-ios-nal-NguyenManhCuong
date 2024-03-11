import UIKit

// Challenge 1
enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}
let coinPurse: [Coin] =
[Coin.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]
func total( arr : [Coin]) {
    var sum = 0
    for item in arr {
        sum += item.rawValue
    }
    print("ket qua la: \(sum)")
}
total(arr: coinPurse)



// Challenge 2
enum Month: Int {
    case january = 1, february, march, april, may, june, july,
         august, september, october, november, december
}
func numberOfmonthUntilSummer(monthNow : Month) {
    if monthNow.rawValue < 4 {
        print("So thang con lai la : \(Month.april.rawValue - monthNow.rawValue)")
    }
    else {
        guard monthNow.rawValue < 7 else {
            print("So thang con lai la : \(Month.december.rawValue - monthNow.rawValue + 4)")
            return
        }
        print("So thang con lai la : 0")
    }
}
numberOfmonthUntilSummer(monthNow: Month.october)
numberOfmonthUntilSummer(monthNow: Month.may)
numberOfmonthUntilSummer(monthNow: Month.february)



//Challenge 3: Pattern matching enumeration
enum Direction {
    case north
    case south
    case east
    case west
}
let movements: [Direction] = [.north, .north, .west, .south,
                              .west, .south, .south, .east, .east, .south, .east]
func location(dir : [Direction]) {
    var loc = (x: 0, y : 0)
    for item in dir {
        if item == Direction.north {
            loc.y += 1
        }
        if item == Direction.west {
            loc.x -= 1
        }
        if item == Direction.east {
            loc.x += 1
        }
        if item == Direction.south {
            loc.y -= 1
        }
    }
    print("vi tri cua user sau khi di chuyen la: \(loc)")
}
location(dir: movements)
