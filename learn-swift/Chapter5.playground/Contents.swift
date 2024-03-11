import UIKit
// Challenge 1 : in các số từ 10 đến 9
for index in stride(from: 10.0, through: 9.0, by: -0.1)
{
    print(index)
}


// Challenge2 : kiểm tra 1 số xem nó có phải là số nguyên tố haykhoong
func check(_ number: Int ) -> Bool? {
    if number < 2 {
        return false
    }
    else {
        var sum = 0;
        for i in 1...Int(sqrt(Double(number)))  {
            if( number % i == 0) {
                sum += 1
            }
        }
        if(sum == 1){
            return true
        }
    }

    return false
}
print("La so nguyen to : \(check(997)!)")

//Challenge 3 . Fibonacy
func fibo(n: Int) -> Int {
    if n==2 || n==1 {
        return 1
    }
    return fibo(n:n-1) + fibo(n:n-2)
}
print(fibo(n: 10))
