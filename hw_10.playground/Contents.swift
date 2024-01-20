///ДЗ 10 - Замыкания / closure
/* Кложуры - функции без имени
Пример записи кложуры:

 var perem = (Int, Int) -> Int = {a, b in
 return a + b
 }
 
 Мы создали кложуру с параметрами a, b
 
 Теперь сделаем еще проще запись
 var perem = (Int, Int) -> Int = { $0 + $1 }
 $0 - первый параметр
 $1 - второй параметр
 -------
 Функция котораяп ринимает другую функцию
 
 func myFunc(a: Int, b: Int, mathFunc: (Int, Int) -> Int) {
 let result = mathFunc(a,b)
 print(result)
 }
 */
//
//Написать сортировку массива с помощью замыкания, сначала по возрастанию, затем по убыванию. Вывести всё в консоль.
let numbers = [1, 20, 3, 4, 510]
 
var sortNumbers = numbers.sorted {$0 < $1}
var sortNumber2 = numbers.sorted {$0 > $1}
 
print(sortNumbers)
print(sortNumber2)

//Создать метод который запрашивает имена друзей, после этого имена кладет в массив, сортирует этот массив по количеству букв в имени и возвращает результат - отсортированный массив

var friends: [String] = []

func nameFriend(name: String) {
 friends.append(name)
    var sortFriends = friends.sorted {($0.count > $1.count)}
    print(sortFriends)
}

nameFriend(name: "Kri")
nameFriend(name: "Alina")
nameFriend(name: "Emilia")
nameFriend(name: "Ingeborge")

//Написать функцию, которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами

//решение 1
var dictKey: [String: Int] = ["Age1": 2023, "Age2": 2024]
 

func getKey(keys: String) {
    for (key, value) in dictKey {
        if dictKey .isEmpty {
            print("Словарь пустой")
        } else if key == keys {
            print("Ключ \(key), значение \(value)")
        } else {
            print("Ключ \(key) не равен \(keys)")
        }
    }
}
getKey(keys: "Age1")

//Решение 2
var dictKey2: [String: Int] = ["Age1": 2023, "Age2": 2024]

func getKey(keys: [String]) {
    for key in keys {
        if dictKey2[key] == nil {
            print("Ключа \(key) нет в словаре")
            continue
        }
        print("Ключ \(key) имеет значение - \(dictKey2[key]!)")
    }
}
getKey(keys: ["Age1", "spasibo dura", "privet"])


//Написать функцию, которая принимает пустые массивы(один - строковый, второй - числовой) и проверяет их: если пустой - то добавить значения (любые) и вывести в консоль.


func myArray (arrayString: inout [String] , arrayInt: inout [Int]) {
    if arrayString.isEmpty {
        arrayString.append("Lena")
        arrayString.append("Kris")
        print("Массив был пустой, заполнился значениями - \(arrayString)")
    } else {
        print("Массив не пустой - \(arrayString)")
    }
    if arrayInt.isEmpty {
        arrayInt.append(25)
        arrayInt.append(27)
        print("Массив был пустой, заполнился значениями - \(arrayInt)")
    } else {
        print("Массив не пустой - \(arrayInt)")
    }
}


var names = [String]()
//var names = ["Bob"]
var age: [Int] = []

myArray(arrayString: &names, arrayInt: &age)

