


//시도했지만 실패한 방법
//var sugar = Int(readLine()!)!
//var sugarCopy = sugar
//
//var five = 0
//var three = 0
//var t = 0
//
//var isImpossibilityFirst = false
//var isImpossibilitySecond = false
//
//for _ in 0... {
//    
//    var quotient = sugar / 5
//    var remainder = sugar % 5
//    sugar = sugar % 5
//    
//    five += quotient
//    
//    if remainder == 0 {
//        break
//    }
//    
//    if quotient == 0 && remainder != 0 {
//        var q = remainder / 3
//        var r = remainder % 3
//        sugar = sugar % 3
//        three += q
//        
//        if r == 0 {
//            isImpossibilityFirst = false
//            break
//        }
//        
//        if q == 0 && r != 0 {
//            isImpossibilityFirst = true
//            break
//        }
//    }
//}
//
//for _ in 0... {
//    var quotient = sugarCopy / 3
//    var remainder = sugarCopy % 3
//    sugarCopy = sugarCopy % 3
//    
//    t += quotient
//    
//    if remainder == 0 {
//        isImpossibilitySecond = false
//        break
//    }
//    
//    if quotient == 0 && remainder != 0 {
//        isImpossibilitySecond = true
//        break
//    }
//}
//
//print(five, three, t)
//print(isImpossibilityFirst, isImpossibilitySecond)
//
//
//if isImpossibilityFirst == true && isImpossibilitySecond == true {
//    print(-1)
//} else if isImpossibilityFirst == true && isImpossibilitySecond == false {
//    print(t)
//} else if isImpossibilityFirst == false && isImpossibilitySecond == true {
//    print(five+three)
//} else {
//    print(min(five+three, t))
//}


var sugar = Int(String(readLine()!))!
var bag = 0

while sugar >= 3 {
    if sugar % 5 == 0 {
        bag += 1
        sugar -= 5
    } else {
        sugar -= 3
        bag += 1
    }
}

if sugar == 0 {
    print(bag)
} else {
    print(-1)
}
