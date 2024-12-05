// ДЗ 5 - Словари
// Создать 10 разных Dictionary с разными типами данных
let klass = ["Anna": 1, "Max": 2, "Elena": 3]
let ringSize = ["flower": 7, "wedding": 6.5, "cat": 5.5]
let favoriteFilms = ["MidSommar": true, "1+1": false, "Hereditary": true, "Shrek": true, "Spider-Man": false]
typealias myChar = Character
let firstСharacter: [String: myChar] = ["MidSommar": "M", "Hereditary": "H", "Shrek": "S", "Spider-Man": "S"]
let countMoney = [2020: 100000, 2021: 110000, 2022: 220000, 2023: 310000, 2024: 1000000]

// Создать 2 Dictionary, в одном должны быть все месяца на русском, в другом на английском. Чтобы к словарю можно было так обращаться dict1[1] // Январь
let monthsRu = [1: "Январь", 2: "Февраль", 3: "Март", 4: "Апрель", 5: "Май", 6: "Июнь", 7: "Июль", 8: "Август", 9: "Сетнябрь",  10: "Октябрь",  11: "Ноябрь", 12: "Декабрь"]

let monthsEu = [1: "January", 2: "February", 3: "March", 4: "April", 5: "May", 6: "June", 7: "July", 8: "August", 9: "September",  10: "October",  11: "November", 12: "December"]

monthsRu[2]
monthsEu[1]

// Собрать все ключи и значения каждого Dictionary и распечатайте в консоль

for (keys, values) in monthsRu  {
    print("\(keys) месяц в году - \(values)")
}

for (keys, values) in monthsEu  {
    print("\(keys) месяц в году - \(values)")
}

// Создать пустой Dictionary и через условный оператор if проверьте пустой он или нет, если пустой то добавить в него пару любых значений

var emptyDict = [String: Int]()

if emptyDict .isEmpty {
    emptyDict["Nika"] = 26
    emptyDict["Kris"] = 27
} else {
    print("Словарь emptyDict не пустой")
}

print(emptyDict)


// еще решение
var dictEmpty = [Int: String]()

if dictEmpty.isEmpty {
    dictEmpty[1] = "Swift"
    dictEmpty[2] = "Python"
    dictEmpty[3] = "C++"
} else {
    print("Словарь dictEmpty не пустой")
}
print(dictEmpty)



//// Другие задания для тренировки
//Создание словаря с информацией:
//
//Создайте словарь с именем и возрастом нескольких друзей.

let friends = ["Diana": 25, "Nastya": 25, "Milana": 27, "Marina": 26]

//Выведите на экран информацию о каждом друге, используя цикл for-in.

for friend in friends {
    print("Моей подруге: \(friend.key) - \(friend.value) лет")
}

//Работа с ключами и значениями:
//
//Создайте словарь с названиями фруктов и их ценами.
let fruits = ["Banana": 150, "Apple": 80, "Peach": 250, "Orange": 180]
//Выведите на экран только названия фруктов, используя ключи словаря.
for fruit in fruits {
    print(fruit.key)
}
//Выведите на экран только цены фруктов, используя значения словаря.
for fruit in fruits {
    print(fruit.value)
}
//Изменение и добавление данных в словарь:
//
//Создайте словарь с парами "день недели" и "план на день".
var week = ["Monday": "work", "Tuesday": "sleep", "Wednesday": "play PS", "Thursday": "play tennis", "Friday": "work", "Sunday": "sleep"]
//Измените план на вторник, добавив новые задачи.
week["Tuesday"] = "work"
print(week)
//Добавьте план на субботу.
week["Saturday"] = "sleep"
print(week)
//Условная проверка в словаре:
//
//Создайте словарь, представляющий собой список предметов и их оценок в школе.
let school = ["Math": 5, "English": 3, "Biology": 5, "Music": 5]
//Напишите код, который проверяет, есть ли определенный предмет в словаре, и выводит соответствующее сообщение.

let predmet = "Biology"

if let ocenka = school[predmet] {
    print("Оценка по \(predmet) - \(ocenka)")
} else {
    print("\(predmet) нет в списке")
}


//Удаление данных из словаря:
//
//Создайте словарь, представляющий собой список контактов (имя и номер телефона).
var contacts = ["Max": 89870000000, "Alexey": 8956453345, "Alina": 8999993377]
//Удалите один из контактов из словаря.
contacts.removeValue(forKey: "Max")
//Выведите обновленный список контактов.
print(contacts)

// Взять ключи словаря dictMoney и поместить их в массив arrayI и значения словаря dictMoney и поместить их в массив arrayJ

var dictMoney = ["Kris": 200, "Lena": 300, "Tasya": 500]

var arrayKey = dictMoney.keys
var arrayValue = dictMoney.values


print(arrayKey)
print(arrayValue)

//for (i,j) in dictMoney{ // цикл, где i - ключ словаря, j - значение словаря
//     arrayI.append(i) // поместить i в массив
//     arrayJ.append(j) // поместить j в массив
//}

//for i in dictMoney {
//    arrayKey.append(i.key)
//    arrayValue.append(i.value)
//}

// Создание пустого словаря
var emptyDict1: [String: Int] = [:]


// Взять значение из словаря по ключу
let exampleDict = ["Billie Eilish": "bad guy", "Kendrick Lamar": "Drunk", "Azizi Gibson": "Cobra"]
let myFavSong: String? = exampleDict["Billie Eilish"]

// через if
if let value = myFavSong {
    print("В словаре есть твоя любимая песня - \(value)")
} else {
    print("Нет в этом словаре твоей любимой песни")
}

// через гуард
func printMySong(dict: [String: String], key: String) -> String {
    guard let value = dict[key] else { return "Нет в этом словаре твоей любимой песни" }
    return "В словаре есть твоя любимая песня - \(value)"
}
printMySong(dict: exampleDict, key: "Kendrick Lamar")

//Через тернарный оператор
myFavSong != nil ? print(myFavSong!) : print("Нет в этом словаре твоей любимой песни")

//Тут проверяем условие myFavSong != nil:
//Если песня найдена, распаковывается значение с помощью myFavSong! и выводится.
//Если ключа нет, выводится сообщение "Нет в этом словаре твоей любимой песни".


