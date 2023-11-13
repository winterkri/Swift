// ДЗ 5 - Словари
// Создать 10 разных Dictionary с разными типами данных
let klass = ["Anna": 1, "Max": 2, "Elena": 3]
let ringSize = ["flower": 7, "wedding": 6.5, "cat": 5.5]
let favoriteFilms = ["MidSommar": true, "1+1": false, "Hereditary": true, "Shrek": true, "Spider-Man": false]
typealias myChar = Character
let firstСharacter: [String: Character] = ["MidSommar": "M", "Hereditary": "H", "Shrek": "S", "Spider-Man": "S"]
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
    print("Массив не пустой")
}

print(emptyDict)
