
import Foundation

func solution(_ myString:String) -> String {
    let chars = myString.map { c -> String in
        if c == "a" || c == "A" {
            return c.uppercased()
        }
        return c.lowercased()
    }
    
    let result = chars.joined()
    
    return result
}

print(
    solution("PrOgRaMmErS")
)
