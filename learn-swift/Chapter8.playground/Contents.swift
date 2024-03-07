import UIKit

//Challenge 1: Repeating yourself
func repeatTask(times: Int, task: () -> Void) {
    task()
}
for _ in 1...10 {
    repeatTask(times: 10, task: { print("Swift Apprentice is a great book!")})
}


//Challenge 2: Closure sums
func mathSum(length: Int, series: (Int) -> Int) -> Int {
    return series(length)
}

func fibo(n: Int) -> Int {
    if(n==2 || n==1) {
        return 1
    }
    return fibo(n:n-1) + fibo(n:n-2)
}
func quare(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return n*n + quare(n: n-1)
}
print(mathSum(length: 10, series: {quare(n: $0)}))
print(mathSum(length: 10, series: {fibo(n: $0)}))
