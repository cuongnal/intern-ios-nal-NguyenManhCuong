import UIKit

//Challenge 1: Which is valid
//1,3,4,6,9,10,13 là các câu lệnh đúng


/*Challenge 2: Remove the first number
Write a function that removes the first occurrence of a given integer from an array of
integers.*/
func removingOnce(_ item: Int,fr arr: [Int] ) -> [Int] {
    var new = arr
    for index in 0..<arr.count{
        if item == new[index] {
            new.remove(at: index)
            break
        }
    }
    return new
}
removingOnce(10, fr: [10,20,3,4,2])


//Challenge 3: Remove the numbers
func removingAll(_ item: Int,fr arr: [Int] ) -> [Int] {
    let new = arr.filter({$0 != item})
    return new
}
removingAll(10, fr: [10,20,3,4,2,10,5,10])



//Challenge 4: Reverse an array
func reversed(_ array: [Int]) -> [Int] {
    var new = [Int]()
    for i in stride(from: array.count-1, through: 0, by: -1) {
        new.append(array[i])
    }
    return new
}
reversed([1,2,3,4,5,6])



//Challenge 5: Return the middle
func middle(_ array: [Int]) -> Int? {
    var mid : Int = 0
    if array.count % 2 == 0 {
        mid = array.count / 2 - 1
    }
    else {
        mid = array.count / 2
    }
    return array[mid]
}
middle([1,2,3,4,5,6])


//Challenge 6: Find the minimum and maximum
func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    var max = numbers[0]
    var min = numbers[0]
    if numbers.isEmpty {
        return nil
    }
   
    else {
        for i in stride(from: 0, through: numbers.count - 1, by : 1) {
            if numbers[i] > max {
                max = numbers[i]
            }
            if(numbers[i] < min) {
                min = numbers[i]
            }
        }
    }
    return (min,max)
}

minMax(of: [1,4,2,7,4,8,9,4,6,8])



//Challenge 7: Which is valid
// 3,5,8,9,10 là các câu lệnh đúng


//Challenge 8: Long names
func find(dict : [String: String]) -> [String:String] {
    var dictNew : [String: String] = [:]
    for (key,value) in dict {
        if(value.count >= 8) {
            dictNew[key] = value
        }
    }
    return dictNew
}

