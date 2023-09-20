import MyMacro

let numberOne = 17
let numberTwo = 25

let (result, code) = #stringify(numberOne + numberTwo)

print("The value \(result) was produced by the code \"\(code)\"")
