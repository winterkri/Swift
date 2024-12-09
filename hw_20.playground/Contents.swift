import Foundation
//Эксиеншены добавляют новую функциональность в классы, структуры, перечисления и протоколы
//Расширить String, чтобы мы могли получать целочисленное значение из строки (неопциональное (0, если не получилось преобразовать) и опциональное)

extension String {
    func toInt() -> Int {
      //  return Int(self) ?? 0
        guard let value = Int(self) else {return 0}
        return value
}
    
    func toOptional() -> Int? {
        return Int(self)
    }
}
"123".toInt()
"xyz".toInt()
"zyx".toOptional()
"321".toOptional()


//Расширить Int и добавить 3 метода возведение в квадрат, куб, степень
extension Int {
    func toSquare() -> Int {
        return self * self
    }
    
    func toСube() -> Int {
        return self.toSquare() * self
    }
    
    func toDegree() -> Int {
        return self.toСube() * self
    }
}

4.toSquare()
5.toСube()

let number = 10
number.toDegree()

//Расширить еще 3 структуры на свой вкус так, чтобы появилось какое-то удобство у расширение. Например, extension string, которое делает все буквы в нем с маленькими
//Экстеншен, который делает в строке все буквы с маленькой
extension String {
    func toLowercase() -> String {
       let result = self.lowercased()
        return result
    }
}

print("PrIvEtIkI".toLowercase())

//Проверяем слово на полиандром
extension String {
    var isPolindrom: Bool {
        let revString = String(self.reversed()).toLowercase()
        guard self.toLowercase() == revString else {
            return false
        }
        return true
    }
}

"Мадам".isPolindrom
"Свифт".isPolindrom



//экстеншен, с помощью которого можно перевернуть число
extension Int {
    var reversedNumbers: Int? {
   let toString = String(String(abs(self)).reversed()) //сначала абсолютное число преобразовывается в строку, потом функция reversed переворачивает строку, и далее мы снова делаем из последовательности символов строку
        if let result = Int(toString) {
            return self < 0 ? -result : result // используем тернарный оператор для того, чтобы добавить знак к результату (если число меньше 0, то возвращаем результат с минусом, иначе возвращаем просто результат)
        }
        return nil
    }
}

123.reversedNumbers
let reverseNum = -876
reverseNum.reversedNumbers

//Экстеншен, который в массиве будет находить определенный элемент в массиве строк
extension Array {
    func findElement(element: String, arr: [String]) -> Int? {
        for (index, value) in arr.enumerated() { //пробежимся циклом по индексам и значениям в массиве
            if value == element { // иесли значение в массиве будет равно переданному в функцию элементу element
                return index // вернем индекс
            }
        }
        return nil //иначе нил вернем
    }
}
//Чекаем работу
let myaArray = ["Hello", "World", "Swift", "SwiftUI"]
myaArray.findElement(element: "Swift", arr: myaArray)


//Добавьте свойство (проперти), которое возвращает количество символов в числе

extension Int {
    var count: Int {
         let result = String(abs(self)) // Памятка: с помощью функции abs берем абсолютное значение числа (значение без учета знака)
         return result.count
    }
}

34576876.count
let absCount = -876
absCount.count

//Добавить метод который говорит число положительное или отрицательное


extension Int {
    // Решение 1:
    func isPositiveOrNegative() -> String {
        guard self > 0 else {return "Число отрицательное"}
        return "Число положительное"
    }
    //Решение 2, тут уже учтем 0
    func isPositiveOrNegative2() -> String {
        switch self {
        case let value where value > 0:
            return "Число положительное"
        case let value where value < 0:
            return "Число отрицательное"
        default:
            return "Ноль"
        }
    }
}

(-1).isPositiveOrNegative()
20.isPositiveOrNegative2()
0.isPositiveOrNegative2()
