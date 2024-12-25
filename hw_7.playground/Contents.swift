//ДЗ 7 - Опционалы
//
//Создать 5 констант строчного типа, которые содержат цифры и посчитайте их сумму, используя новые инструменты.


let (num1, num2, num3, num4, num5) = ("45", "32", "2", "1а", "10") // создаем константы и присваеваем каждой по значению из кортежа
var sum3 = 0 // переменная для подсчета суммы

for i in [num1, num2, num3, num4, num5] { // перебираем массив строк
    if Int(i) != nil { //проверяем, что строку можно преобразовать в целое число, если да
        sum3 += Int(i)! // то, прибавляем значение к sum3
        print(sum3)
    } else {
        print("Есть значение nil") //нельзя пстроку преобразовать в целое число
    }
}
print(sum3)


//Создать 5 констант со значением nil
let age: Int? = nil
let name: String? = nil
let weight: Double? = nil
let master: Bool? = nil
typealias myType = Character
let firstcharName: myType? = nil

//Создать 5 опциональных типов констант, а затем установить им значения
let age1: Int?
let name1: String?
let weight1: Double?
let master1: Bool?
typealias myType1 = Character
let firstcharName1: myType1?

age1 = 27
name1 = "Kri"
weight1 = 59.5
master1 = true
firstcharName1 = "K"

print(age1!, name1!, weight1!, master1!, firstcharName1!)

//Создать переменную строчную, в которую записать свое имя, а затем распечатать ее по буквам
var myName: String = "Kristina"

for i in myName {
    print(i)
}

//Создать массив с целочисленными цифрами в хаотичном порядке. Распечатать в упорядоченном порядке эти цифры
// Первый вариант решения:

var arrayNum = [20, 43, 76, 1, 6, 98, 45]
var arrayPo = arrayNum.sorted()
print(arrayPo)

// Второй вариант решения:
for number in arrayPo {
    print(number)
}

//Доп здаания

//перевернуть строку

let name12 = "Tasya"
// Решение 1:
let nameReversed = String(name12.reversed()) // name.reversed() возвращает перевёрнутую последовательность символов, его нужно привести к строке
print(nameReversed)

//Решение 2:
var value: String = ""
for i in name12.reversed() {
    value += String(i)
}
print(value)

//Решение 3:

var value2: String = ""
for i in stride(from: name12.count - 1, through: 0, by: -1)  {
    value2 += String(name12[i])
}

print("Решение с индексом: \(value2)")

//экстеншен для доступа к символам строки по индексу
extension String {
    subscript (index: Int) -> Character { //сабскрипт, который принимает индекс
            let indexValue = self.index(self.startIndex, offsetBy: index) // получаем позицию символа в строке
            return self[indexValue] //возвращаем символ по позиции
        }
    }


//написать экстеншен для стринг, чтобы когда мы обращались к name12[i] у нас вывдилось значение

//self[i]) -> Character {
//        self[self.index(self.startIndex, offsetBy: i)]
//    }


