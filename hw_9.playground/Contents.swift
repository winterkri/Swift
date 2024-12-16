import Foundation
//ДЗ 9 - Function / функции / методы
//
//Создать 3 функции: 1 - которая ничего не принимает и ничего не возвращает. 2 - Принимает, но не возвращает. 3 - И принимает и возвращает = и все три вызвать потом. Что делают функции, выбери сам(а)
// 1-я функция
func firstFunc() {}
firstFunc()

// 2 - Принимает, но не возвращает

func secondFunc(a: Int, b: Int) {}
secondFunc(a: 1, b: 2)

// 3-принимает и возвращает

func thirdFunc(str: String) -> Int {
    if str .isEmpty {
        return 0
    } else {
            return str.count
        }
}
thirdFunc(str: "")

//Создать журнал для учителя, который будет принимать имя студента, профессию и оценку, затем будет записывать это все в массив. И внесите 10 студентов туда и распечатаете через цикл for

var arrayStudents: [(String, String, Int)] = [] //создаем массив тюплов

func magazine(name: String, profession: String, grade: Int) { //объявляем функцию принимающую значения
    arrayStudents.append((name, profession, grade)) //добавляем в массив тюплов данные
}
magazine(name: "Kris", profession: "QA", grade: 5)
magazine(name: "Elena", profession: "Admin", grade: 5)
magazine(name: "Nastya", profession: "Dev", grade: 5)
magazine(name: "Diana", profession: "AQA", grade: 2)
magazine(name: "Milana", profession: "Project Manager", grade: 1)
magazine(name: "Evgenya", profession: "Product Owner", grade: 3)
magazine(name: "Alexey", profession: "CTO", grade: 4)
magazine(name: "Alina", profession: "Tech manager", grade: 5)
magazine(name: "Vika", profession: "Designer", grade: 3)
magazine(name: "Valerya", profession: "Backand Developer", grade: 2)

for element in arrayStudents {
    print(element)
}

//Создать функцию которая принимает имя и фамилию, и возвращает имя + фамилию в одной строке, потом пройтись по массиву с именем и фамилией и распечатать скрепленные имен и фамилия вместе в консоль

var data: [String] = [] //создаем массив

func nameSurname(name: String, surname: String) -> String {
    let str = "\(name) \(surname)" //склеиваем имя и фамилию
    data.append(str) //помещаем склеенные данные в массив
    return str // возвращаем строку
}
nameSurname(name: "Kris", surname: "Zima")
nameSurname(name: "Lena", surname: "Sergeeva")
nameSurname(name: "Alina", surname: "Smirnova")
nameSurname(name: "Tasya", surname: "Malaman")
//print(data)

for element in data {
    print(element)
}


// Можно еще просто выводить склеенное имя и фамилию:
func nameSurname2(name: String, surname: String) -> String {
    return "\(name) \(surname)" // Склеиваем имя и фамилию

}

// Прямой вывод результата в консоль
print(nameSurname2(name: "Kris", surname: "Zima"))
print(nameSurname2(name: "Lena", surname: "Sergeeva"))
print(nameSurname2(name: "Alina", surname: "Smirnova"))
print(nameSurname2(name: "Tasya", surname: "Malaman"))


//Создайте функцию которая принимает параметры и вычисляет площадь круга

let pi = 3.14

func area(r: Double) -> Double {
   let areaK = pi * pow(r, 2)
    return areaK
}
area(r: 5.0)

// Вычислить площать трапеции


func ploshadTrapecii (a: Double, b: Double, h: Double) -> Double {
    let s = 0.5 * ( a + b ) * h
    return s
}

let ploshad = ploshadTrapecii(a: 2, b: 4, h: 10)
print("Площадь трапеции - \(ploshad)")

// Вспоминала, что забыла

//Создайте Dictionary, с именем ученика(цы), где ключ name и score, а значение дата, когда человек получил такую оценку

var dictStudent: [String: [Int: String]] = [:]

if dictStudent.isEmpty {
    dictStudent["Kris"] = [4: "202-01-01"]
    dictStudent["Lena"] = [5: "202-02-02"]
    dictStudent["Tasya"] = [5: "202-03-03"]
}
print(dictStudent) // печатаем словрь полностью
print(dictStudent.keys) //печатаем ключи словря
print(dictStudent.values) //печатаем значения

//Узнать какую оценку получила Лена

print(dictStudent["Lena"]!.keys)

//Узнать когда она получила оценку 5
let date = dictStudent["Lena"]![5]
print(date!)


//////Создать журнал для учителя, который будет принимать имя студента, профессию и оценку, затем будет записывать это все в массив. И внесите 10 студентов туда и распечатаете через цикл for
/////
//var arry: [(name: String, proff: String, grade: Int)] = [] // создали массив тюплов
//
//func jurnal (name: String, proff: String, grade: Int) { // создали функцию, которая принимает эти параметры
//    arry.append((name, proff, grade)) //добавили в массив тюпл
//}
//
//jurnal(name:"Kris", proff: "QA", grade: 4)
//jurnal(name:"Alya", proff: "Dev", grade: 1)
//
//for i in arry {
//    print(i)
//}


// ------ задачки для закрепления темы
//Создайте функцию, которая будет выводить на консоль сумму следующих чисел:
//Функция должна быть без параметров и без возвращаемых значений.

let numberOne = 78
let numberTwo = 44

func printim() {
    print(numberOne + numberTwo)
}

printim()


//Создайте функцию, которая будет возвращать рандомное значение от 0 до 100 типа Double.

func randomNumber() -> Double {
    return Double.random(in: 0...100)
}

randomNumber()

//Создайте функцию, которая будет принимать в качестве параметра целое число, и выводить на консоль все числа этого значения.
//Например если мы передадим в функцию 5 то при вызове данной функции мы должны увидеть следующий результат:

func printNumber(_ number: Int) {
    for i in 1...number {
        print(i)
    }
}

printNumber(5)

//Создайте функцию, которая принимает имя пользователя в параметр, и возвращает логическое значение true если имя не превышает
//четырех символов.
//
func userName (name: String) -> Bool {
    //Решение 1
//    if name.count <= 4 { // если кол-во символов в переданном имени меньше либо = 4, то возвращаем тру
//        return true
//    } else {
//        return false
//    }
    //Решение 2:
//    guard name.count <= 4 else { return false }
//    return true
    
    //Решение 3
   return name.count <= 4
}

userName(name: "Kristina")
userName(name: "Yan")

//Решение 4:
let name = "Kristinka"
let value = name.count <= 4 ? true : false




//Создайте функцию, которая будет принимать в качестве параметра целое число, и возвращать массив со всеми числами
//этого значения. Например если мы передадим в функцию 5 то при вызове данной функции она вернет массив [1, 2, 3, 4, 5].
//Присвойте результат работы функции новому свойству.

func primeNumbers(number: Int) -> [Int] {
    var arrayNumbers: [Int] = []
    for i in 1...number {
        arrayNumbers.append(i)
    }
    return arrayNumbers
}

let totalArray = primeNumbers(number: 10)
print(totalArray)

//функция, которая возвращает массив именно простых чисел

func arrPrimeNumbers(number: Int) {
    var primeNumbers: [Int] = []
    guard number > 1 else {return}
    for i in 2...number { // Перебираем числа от 2 до заданного числа
        var isPrime = true
        for j in 2..<i { // Проверяем делимость числа i на все числа от 2 до i-1
            if i % j == 0 {  // Если делится, то это не простое число
                isPrime = false
                break
            }
        }
        if isPrime { // Если число осталось простым, добавляем его в массив
                   primeNumbers.append(i)
               }
    }
    print(primeNumbers)
}

arrPrimeNumbers(number: 10)


//Для всех i от 1 до 10 {
//проверить, делится ли число i на какое-либо из чисел до него
//если делится, то это i не подходит, берём следующее
//если не делится, то i - простое число
//}


//дайте функцию, которая будет принимать следующий словарь со студентами:
let students = ["Tim": Int.random(in: 1...100),
                "Sem": Int.random(in: 1...100),
                "Taylor": Int.random(in: 1...100),
                "Stan": Int.random(in: 1...100)]

//Ключом является имя студента, а значением его проходной балл.
//Функция должна возвращать словарь с теми же студентами, но в качестве значения должен выступать статус либо hight либо low (для
//этого можно определить перечисление), если у студента баллы выше или равны 50 то мы для него определяем группу hight, если
//ниже то low.
//Присвойте результат работы функции новому свойству
// Решение через if
//func statusStudents(stud: [String: Int]) -> [String: String] {
//    var newStatusDict: [String: String] = [:]
//    for i in stud { //бежим циклом по элементам переданного при вызове функции словаря
//        if i.value >= 50 { //если значение элемента, например, "Tim": Int.random(in: 1...100) с индексом i больше либо = 50
//            newStatusDict[i.key] = "High" // вставляем в созданный словарь значение "High" для ключа i.key
//        } else {
//            newStatusDict[i.key] = "Low"
//        }
//        }
//    return newStatusDict
//    }
//
//print(statusStudents(stud: students))

print(students)

// Решение через тернарный оператор
func statusStudents(stud: [String: Int]) -> [String: String] {
    var newStatusDict: [String: String] = [:]
    for i in stud { //бежим циклом по элементам переданного при вызове функции словаря
         newStatusDict[i.key] = i.value >= 50 ? "High" : "Low"
    }
    return newStatusDict
}
print(statusStudents(stud: students))


//Задача: Напишите функцию, которая принимает массив целых чисел и возвращает массив строк, где каждое число преобразовано в строку "Even" (четное), "Odd" (нечетное) или "Zero" (ноль). Используйте тернарный оператор для преобразования каждого числа.

func getArrayNumbers(arr: [Int]) -> [String] {
    var arrayStrings: [String] = []
    for i in arr {
        arrayStrings.append(i == 0 ? "Zero" : (i % 2 == 0 ? "Even" : "Odd"))
    }
    return arrayStrings
}

print(getArrayNumbers(arr: [1, 2, 3, 4, 5, 6, 0]))


//Сортировка пузырьком
//Функция, которая сортирует числа от самого маленьког очисла до самого большого

func bubbleSort(arr: [Int])  {
    var sortedArray = arr
    var tmp = 0
    for i in 0..<sortedArray.count {
        for j in 0..<sortedArray.count - 1 {
            if sortedArray[j] > sortedArray[j + 1] { // если элемент слева больше эелемнта справа
                tmp =  sortedArray[j] // присваиваем левый элемент в переменную tmp
                sortedArray[j] = sortedArray[j + 1] // ставим на место левого элемента правый
                sortedArray[j + 1] = tmp // а на место правого элемента левый
            }
        }
    }
    print(sortedArray)
}

bubbleSort(arr: [2, 10, 4, 5])

//Функция, которая сортирует массив строк по длине строк (от самой короткой до самой длинной).

func sortString(arr: [String]) {
    var newArr = arr
    for i in 0..<newArr.count {
        for j in 0..<newArr.count - 1 {
            if newArr[j].count > newArr[j + 1].count {
                var tmp = newArr[j]
                newArr[j] = newArr[j + 1]
                newArr[j + 1] = tmp
            }
        }
    }
    print(newArr)
}

sortString(arr: ["Test", "Error", "Void", "Hej", "i love swift"])
