import UIKit

// Challenge1
let coordinates = (1,2,3)


//Challenge 2: Named coordinate
typealias namesCoordinate = ( Int,Int );
let xy: namesCoordinate = (10,20)

//Challenge 3: Which are valid
let string: String = "! " ; // hợp lệ
let string1: String = "Dog" // hợp lệ

//Challenge 4: Nó không compile được vì tuple.Day sai cú pháp
//cú pháp đúng là
let tuple = (day: 15, month: 8, year: 2015)
let day = tuple.day


//Challenge 5: Find the error
// lỗi vì khi khai báo bằng let thì giá trị của biến không thể thay đổi

//Challenge 6: What is the type of value?
// value sẽ có type là Int

//Challenge 7: What is the value of month?
// month sẽ có type là Int



//Challenge 9: Compute the value
let a = 4
let b: Int32 = 100
let c: UInt8 = 12
// giá trị của a là 4, b là 100, c là 12
