import UIKit
//Challenge 1: Variables
func countDogs() -> Int {
    var myAge = 22
    var dogs : Int = 0
    dogs+=1
    return dogs
}
countDogs()


// Challenge 2: Make it compile
// để có thể thay đổi được biến age thì cần phải khai báo là var.



// Challenge 3: Computer the answer
let x: Int = 46
let y: Int = 10
// 1. kết quả sẽ là 4610
let answer1: Int = (x * 100) + y
// 2. kết quả sẽ là 5600
let answer2: Int = (x * 100) + (y * 100)
// 3. kết quả sẽ là 4601
let answer3: Int = (x * 100) + (y / 10)




// Challenge 4: thêm các dấu ngoặc đơn sao cho kq không đổi

8 - 4 * 2 + 6 / 3 * 4
(8 - (4 * 2)) + ((6 / 3) * 4)



// Challenge5:
func countAverageRating()-> Double{
    var ratting1 : Double = 5.5
    var ratting2: Double = 6.2
    var ratting3 :Double = 7.8
    let AverageRating = (ratting1 + ratting2 + ratting3)/3
    return AverageRating
}
countAverageRating()



//Challenge6
let voltage: Double = 10.3
let current: Double = 4.5
let power = voltage*current



//Challenge7
let resistance = power / pow(current,2)


