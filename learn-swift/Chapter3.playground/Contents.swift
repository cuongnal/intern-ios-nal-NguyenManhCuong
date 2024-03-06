import UIKit
import Darwin
import CoreFoundation

//Challenge 1: Find the error
// lastName là biến cục bộ chỉ có giá trị trong block code if. khi ra ngoài block. biến lastName này không toồn tại


//Challenge 2: Boolean challenge

let answer = true && true // giá trị là true
let answer1 = false || false // giá trị là false
let answer2 = (true && 1 != 2) || (4 > 3 && 100 < 1) // giá trị true
let answer3 = ((10 / 2) > 3) && ((10 % 2) == 0) // giá trị true


//Challenge 3: Snakes and ladders



//Challenge 4: Number of days in a month
func dayOfMonth(var month1 : Int = 3, var year : Int = 2024) -> Void{

    if(month1 == 2) {
        if( year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
            print(29)
        }
        else{
            print(28)
        }
    }
    else if(month1 == 1 || month1 == 3 || month1 == 5 || month1 == 7 || month1==8 || month1 == 10 || month1 == 12){
        print(31)
    }
    else{
        print(30)
    }
}
dayOfMonth()


//Challenge 6: Triangular number
func triangular_number() -> Void {
    let number = 15
    let kqq : Double = (sqrt(Double(number * 8 + 1)) - 1 ) / 2;
  
}
triangular_number()


//Challenge 7: Fibonacci
func fibo(n: Int) -> Int {
    if(n==2 || n==1) {
        return 1
    }
    return fibo(n:n-1) + fibo(n:n-2)
}
let fib = fibo(n: 5)

