import UIKit


/*Challenge 1: You be the compiler
var name: String? = "Ray"
var age: Int = nil
let distance: Float = 26.7
var middleName: String? = nil
 
 -> ý 1,3,4 là khai báo đúng */



//Challenge 4: Nested optionals, sử dụng if let để in number ra
let number: Int??? = 10
func chall4() -> Void {
    guard let n = number, let m = n, let a = m else {
        print("khong dung")
        return
    }

   print(a)
}
chall4()
@IBAction
