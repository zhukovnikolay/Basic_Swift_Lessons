import Cocoa
import Foundation

//Задание 1
//Решить квадратное уравнение

let a: Double = 1
let b: Double = 2
let c: Double = -4
let dis: Double = b * b - 4 * a * c

if dis < 0{
    print("Решения нет")
}
else if dis == 0{
    print("Корень уравнения: ", (sqrt(dis) - b) / (2 * a))
}
else{
    print("Корни уравнения: ",
          (sqrt(dis) - b) / (2 * a),
          " и ",
          (-sqrt(dis) - b) / (2 * a))
}

//Задание 2
//Даны катеты прямоугольного треугольника.
//Найти площадь, периметр и гипотенузу треугольника.

let k1: Double = 3
let k2: Double = 4
let g: Double = sqrt(k1 * k1 + k2 * k2)
let per: Double = k1 + k2 + g
let pl: Double = k1 * k2 / 2

print("Гипотенуза: ", g)
print("Площадь: ", pl)
print("Периметр: ", per)

//Задание 3
//Пользователь вводит сумму вклада в банк и годовой процент.
//Найти сумму вклада через 5 лет.

var sum: Double = 1000 //сумма вклада
let percent: Double = 8 //процент
let term: Double = 5 //срок

//Округляем до второго знака после запятой
let res: Double = round(100 * sum * pow((1 + percent / 100), term)) / 100
print("Сумма вклада через пять лет: ", res)
