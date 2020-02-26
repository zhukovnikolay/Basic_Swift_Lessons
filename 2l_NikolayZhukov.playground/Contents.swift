import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
func isEven(_ number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    }
    else {
        return false
    }
}

//Проверяем
isEven(3)
isEven(4)

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func divby3(_ number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    }
    else {
        return false
    }
}

//Проверяем
divby3(-9)
divby3(88)

//3. Создать возрастающий массив из 100 чисел.
var IncArray = [Int]()
var max = Int.random(in: 0...10)
for _ in (1...100) {
    IncArray.append(max)
    max = Int.random(in: max + 1...max + 10)
}
//Проверяем
print(IncArray)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for i in stride(from: IncArray.count - 1, to: -1, by: -1) {
    if isEven(IncArray[i]) || !divby3(IncArray[i]) {
        IncArray.remove(at: i)
    }
}
//Проверяем
print(IncArray)

//5. Написать функцию, которая добавляет в массив новое число Фибоначчи,
//   и добавить при помощи нее 100 элементов.
func Fib(_ n: Int) -> [Decimal] {
    var FibArray: [Decimal] = [0, 1]
    for i in (2...n - 1) {
        FibArray.append(FibArray[i - 1] + FibArray[i - 2])
    }
    return FibArray
}
//Проверяем
print(Fib(100))
