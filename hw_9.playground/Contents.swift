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
   var areaK = pi * pow(r, 2)
    return areaK
}
area(r: 5.0)

// Вычислить площать трапеции


func ploshadTrapecii (a: Double, b: Double, h: Double) -> Double {
    let s = 0.5 * ( a + b ) * h
    return s
}

let otvet = ploshadTrapecii(a: 2, b: 4, h: 10)
print("Площадь трапеции - \(otvet)")



//Создайте Dictionary, с именем ученика(цы), где ключ name и score, а значение дата, когда человек получил такую оценку

var dictStudent: [String: [Int: String]] = [:]

if dictStudent.isEmpty {
    dictStudent["Kris"] = [4: "202-01-01"]
    dictStudent["Lena"] = [5: "202-02-02"]
    dictStudent["Tasya"] = [5: "202-03-03"]
}
print(dictStudent)
print(dictStudent.keys)
print(dictStudent.values)

//Узнать какую оценку получила Лена

print(dictStudent["Lena"]!.keys)

//Узнать когда она получила оценку 5
let date = dictStudent["Lena"]![5]
print(date!)



var arry: [(name: String, proff: String, grade: Int)] = []
func jurnal (name: String, proff: String, grade: Int) {
    arry.append((name, proff, grade))
}

jurnal(name:"Kris", proff: "QA", grade: 4)
jurnal(name:"Alya", proff: "Dev", grade: 1)

for i in arry {
    print(i)
}

//Создать функцию которая принимает имя и фамилию, и возвращает имя + фамилию в одной строке, потом пройтись по массиву с именем и фамилией и распечатать скрепленные имен и фамилия вместе в консоль

var nameSurname: [(String, String)] = []

func fio (name: String, surname: String) {
    nameSurname.append((name, surname))
}

fio(name: "Крис", surname: "Зима")
fio(name: "Lena", surname: "Sergeeva")
