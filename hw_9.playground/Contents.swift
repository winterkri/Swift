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

func nameSurname(name: String, surname: String) {
    var str = "\(name) \(surname)" //склеиваем имя и фамилию
    data.append(str) //помещаем склеенные данные в массив
}
nameSurname(name: "Kris", surname: "Zima")
nameSurname(name: "Lena", surname: "Sergeeva")
nameSurname(name: "Alina", surname: "Smirnova")
//print(data)

for element in data {
    print(element)
}

//Создайте функцию которая принимает параметры и вычисляет площадь круга

let pi = 3.14

func area (r: Double) -> Double {
   var areaK = pi * pow(r, 2)
    return areaK
}
area(r: 5.0)


//Создайте Dictionary, с именем ученика(цы), где ключ name и score, а значение дата, когда человек получил такую оценку - напишу после изучения структур, пока что не получается

//let dictStudent: [(String, Int): String] = [:]


