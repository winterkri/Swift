// ДЗ2
// Создать различные выражения с приведением типа
var fingers: Int = -10
var newType = Double(fingers)
print(newType)

// свой тип
typealias myType = Int
var myPhone: myType = 89000000001


// вычислить корень квадратного уравнения
import Foundation

func findX (a: Double, b: Double, c: Double) -> (Double?, Double?) {
    var diskriminant = pow((b),2) - (4 * a * c) // формула дискриминанта
    if diskriminant < 0 { //если дискриминант < 0, то возвращаем нил
        return (nil, nil)
    } else if diskriminant == 0 { // если равен 0, то считаем по формуле и возвращаем корень
        let x = (-b) / (2 * a)
        return (x, nil)
    } else { // иначе вычисляем корни и возвращаем их
        let x1 = ((-b) + sqrt(diskriminant)) / (2 * a)
        let x2 = ((-b) - sqrt(diskriminant)) / (2 * a)
        return (x1, x2)
    }
}

findX(a: 2.0, b: 5.0, c: 2.0) // вызов функции

// вычислить площадь треугольника
// случай когда известны длины сторон а и b.

func area (a: Double, b: Double) -> Double {
    let h = sqrt((pow(b,2)) - (pow(a,2) / 4.0))
    return (a * h) / 2.0
}
area(a: 5.0, b: 7.0)

// Вычислить площадь квадрата

func areaSquare (a: Int) -> Int {
    return a * a
    
}
areaSquare(a: 5)
