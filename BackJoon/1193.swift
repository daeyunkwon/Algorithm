
let n = Int(readLine()!)!
var index = 1
var step = 1
var excute = 1

var numerator = 1
var denominator = 1

while n > index {
    index += 1
    
    if step <= excute {
        step += 1
        excute = 1
        
        if step % 2 == 0 {
            numerator = 1
            denominator = step
        } else {
            numerator = step
            denominator = 1
        }
        
    } else {
        if step % 2 == 0 {
            numerator += 1
            denominator -= 1
        } else {
            numerator -= 1
            denominator += 1
        }
        
        excute += 1
    }
    
}

print("\(numerator)/\(denominator)")


