import UIKit

// Challenge 1: How many times
// giá trị tổng là 15. vòng lặp chạy 6 lần
var sum = 0
for i in 0...5 {
sum += i
}
print(sum)



//Challenge 2: Count the letter
// chuỗi sẽ có 10 từ a. "aaaaaaaaaa", vòng lặp sẽ lặp 11 lần
var aLotOfAs = ""
while aLotOfAs.count < 10 {
aLotOfAs += "a"
}

//Challenge 3: What will print
// lần 1 sẽ in case "On th x/y plane
// lần 2 sẽ in case "x = y = x"
// lần 3 sẽ in case "On the x/y plane"
// lần 4 sẽ in case "Nothing special"
// lần 5 sẽ in case "On the y/z plane"
func challenge3() {
    
}


//Challenge 5: The final countdown
var i = 10;
repeat {
    print(i);
    i-=1;
}
while(i>=0)
        
        
        
//Challenge 6: Print a sequence
var j = 1;
repeat {
    print(Double(j)/10.0);
    j+=1;
}
while(j<=10)
        
        
