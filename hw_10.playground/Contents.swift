///ДЗ 10 - Замыкания / closure
/* Кложуры - функции без имени
Пример записи кложуры:

 var perem: (Int, Int) -> Int = { a, b in
     return a + b
 }
 
 Мы создали кложуру с параметрами a, b
 
 Теперь сделаем еще проще запись
 var perem: (Int, Int) -> Int = { $0 + $1 }
 $0 - первый параметр
 $1 - второй параметр
 -------
 Функция которая принимает другую функцию
 
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

func nameFriend(name: String) -> [String] {
    friends.append(name)
    friends.sorted {($0.count > $1.count)} //сравниваем кол-во символов в строке
    return friends
}

nameFriend(name: "Kri")
nameFriend(name: "Alina")
nameFriend(name: "Emilia")
nameFriend(name: "Ingeborge")

//Написать функцию, которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами

func returnDict (arrName: [String]) -> [String: Int] { //функция принимает массив строк
    var slovar: [String: Int] = [:] // создаем словарь пустой
    for i in arrName { // циклом проходимся по элементам из массива
        slovar[i] = Int.random(in: 1...10) // в словарь slovar по ключу i пишем рандомное значение от 1 до 10, таким образом каждый элемент переданного массива становится ключом словаря с рандомным значением
    }
    return slovar // возвращаем словарь
}

print(returnDict(arrName: ["Kris", "Tasya", "Nastya", "Lena"])) //передаем в функцию массив строк


//Решение 2

let twoSlovar = ["x": 1, "y": 2, "z": 3]

func returnDict2(keys: [String]) {
    keys.forEach { key in
        if let value = twoSlovar[key] {
            print("Ключ - \(key) и его значение - \(value)")
        }
    }
}

returnDict2(keys: ["x","z"])



//Написать функцию, которая принимает пустые массивы(один - строковый, второй - числовой) и проверяет их: если пустой - то добавить значения (любые) и вывести в консоль.


//func forEmptyArrays(arrayOne: [String], arrayTwo: [Int]) {
// 
//    var firstArray = arrayOne
//    var secondArray = arrayTwo
//    
//    if !arrayOne.isEmpty && !arrayTwo.isEmpty {
//        print("Массивы не пусты")
//    } else if arrayOne.isEmpty && arrayTwo.isEmpty {
//        secondArray.append(Int.random(in: 9...100))
//        firstArray.append("Kri")
//    } else if arrayOne.isEmpty {
//        firstArray.append("Bro")
//    } else if arrayTwo.isEmpty  {
//        secondArray.append(Int.random(in: 5...7))
//    }
//    
//    print(firstArray)
//    print(secondArray)
//}
//
//forEmptyArrays(arrayOne: [], arrayTwo: [])


func forEmptyArrays(arrayOne: [String], arrayTwo: [Int]) {
 
    var firstArray = arrayOne
    var secondArray = arrayTwo
    
   if arrayOne.isEmpty && arrayTwo.isEmpty {
        secondArray.append(Int.random(in: 9...100))
        firstArray.append("Kri")
   } else {
       print("Массивы не пусты")
   }
    
    print(firstArray)
    print(secondArray)
}

forEmptyArrays(arrayOne: [], arrayTwo: [])


// ----- Доп задания
//Реализуйте функцию, которая принимает три параметра цена за единицу товара, количество товаров и скидка в процентах. Функция
//должна возвращать общую стоимость заказа, после применения скидки.
//Если значение параметра со скидкой не передано в функцию, то функция должна применять скидку в размере 0%
//Все параметры должны иметь тип Double.

func priceWithdiscount(price: Double, quantity: Double, discount: Double = 0) -> Double {
    let totalPrice = price * quantity
    let discountPrice = totalPrice * discount / 100
    return totalPrice - discountPrice
}

priceWithdiscount(price: 100, quantity: 2)
priceWithdiscount(price: 100, quantity: 2, discount: 10)


// Создайте функцию, которая принимает в качестве параметров любое количество направлений (север, юг, запад и восток) и выводит
//на консоль сообщение о том в каком направлении находится пользователь. Ваша задача вызвать функцию с несколькими значениями
//направления, например если мы передадим в функцию значение север и юг, то должны увидеть на консоли сообщения:

func direction(_ directions: String...) {
    for direction in directions {
        print("Пользователь находится в \(direction) направлении")
    }
}

direction("north")
direction("north", "east")


//Создайте функцию, которая будет удваивать переданное ей значение типа Int, и возвращать этот результат.
func doubleNum (num: Int) -> Int {
    return num * 2
}

doubleNum(num: 10)

//Далее создайте еще одну функцию, которая будет принимать три параметра: функцию созданную ранее, значение, которое
//планируем увеличивать в два раза и число, которое будет отвечать за количество вызовов, переданной в параметр функции.
//Функция должна выводить следующий результат на консоль: "Operation result after iteration <номер итерации> is: <результат>
//Например если мы захотим 5 раз увеличить число 3, то на консоли мы должны получить следующий результат:

func otherFunc (earlyFunc: (Int) -> Int, znachenie: Int, kolichestvo: Int) {
    //    var newNum = znachenie // присваиваем переменной newNum значение из znachenie, то есть 11
    //    for i in 0...kolichestvo {
    //        newNum = earlyFunc(newNum) // присваиваем получившиеся увеличенное значение znachenie, тем самым увеличиваем newNum
    //        print("Operation result after iteration \(i) is: \(newNum)")
    //    }
    //
    
    for i in 0...kolichestvo {
        let value =  earlyFunc(znachenie)
        print("Operation result after iteration \(i) is: \(value)")
    }
}
    
//}

otherFunc(earlyFunc: doubleNum, znachenie: 11, kolichestvo: 3)

//Напишите функцию square, которая возвращает квадрат числа.
//Напишите функцию sumOfSquares, которая использует square, чтобы вернуть сумму квадратов двух чисел.

func square(num: Int) -> Int {
    return num * num
}

func sumOfSquares (numInt: Int, numInt2: Int) -> Int {
    return square(num: numInt) + square(num: numInt2)
}

sumOfSquares(numInt: 2, numInt2: 10)


//здайте свойство с типом блока замыкания, без параметров и без возвращаемых значений. В блоке замыкания выведете фразу на
//консоль: “It’s first closure”. Создайте еще одно свойство и присвойте ему копию вашего клоужера и запустите его

let sv = {
    print("It’s first closure")
}

let sv2 = sv

sv2()

//Создайте свойство с типом блока замыкания с двумя параметрами типа String и Int, и возвращаемым значением типа String. Должна
//вернуться фраза: “Name: <имя>, age: <возраст>”. Присвойте результат работы блока замыкания новому свойству и выведите его на
//консоль.

var dv: (String, Int) -> String = { name, age in
    return "\(name) \(age)"
}

dv("Kris", 27)

//Создайте функцию, которая будет принимать в качестве параметров числовой массив и блок замыкания.

//Данная функция должна находить максимальное значение из массива. Блок замыкания должен захватывать это максимальное значение и выводить его наvконсоль.

//Вызовите три раза данную функцию, при первом вызове в параметр замыкания передайте функцию (создайте ее сами), во
//второй вызов передайте в параметр свойство с типом блока замыкания, и в третий вызов просто раскройте комплишен и реализуйте
//вывод максимального значения на консоль.

func funcForReturn(num: Int) {
    print("Первый вызов: \(num)")
}


let closurePrint: (Int) -> () = { num in
    print("Второй вызовЖ \(num)")
}


func getMaxValue (a: [Int], b: (Int) -> ()) {
    if let maxValue = a.max() { //если maxValue есть, то
        b(maxValue) //передаем в кложуру значение maxValue
    } else {
        print("В массиве пусто")
    }
   
}



getMaxValue(a: [1, 25 ,77, 555, 9], b: funcForReturn)
getMaxValue(a: [1, 10 ,97, 1000, 1025], b: closurePrint)
getMaxValue(a: [1, 10 ,77, 83, 9]) { num in
    print("Третий вызов: \(num)")
}


//Создайте функцию, которая принимает в качестве параметров строку и блок замыкания.
//Логика этой функции заключается в том чтобы из строки сделать массив символов. Блок замыкания должен захватывать тип [Character] и вывводить символы на консоль,
//каждый из которых будет на новой строке. При вызове функции раскройте комплишен.
//Что бы сделать из коллекции (строка это тоже коллекция) массив используйте следующий код: Array(коллекция)



let myChar: (Character) -> () = { char in
    print("\(char)")
}

func getChar(a: String, b: (Character) -> ()) { //объявляем функцию, которую принимает строку и кложуру
    for i in a { // пускаем цикл по значению a
        b(i) //передаем символ в кложуру
    }
        }

getChar(a: "Kristina", b: myChar)
getChar(a: "Kristina") { char in
    print("Второй вызов функцим - \(char)")
}


// Реализация через массив

let myCharArray: ([Character]) -> () = { char in
    for i in char {
        print(i)
    }
    
}


// Тут я переборщила
//func getChar(a: String, b: (Character) -> ()) { //объявляем функцию, которую принимает строку и кложуру
//    var arrStr: [Character] = [] //создаем массив, который будет хранить символы
//    for i in a { // пускаем цикл по значению a
//        arrStr.append(i)
//    }
//    if !arrStr.isEmpty {
//        for j in arrStr {
//            b(j)
//        }
//    }
//}
//
//getChar(a: "Kristina", b: myChar)


//Создайте функцию, которая принимает в качестве параметров Словарь типа [String: Int] и блок замыкания.
//Данная функция должна создать массив из значений словаря. Блок замыкания должен захватывать массив типа Int и выводить на консоль сумму чисел
//массива. Вызовите два раза данную функцию, в первом передайте в параметр свойство с типом блока замыкания, а во второй вызов просто раскройте комплишен и реализуйте
//вывод суммы чисел массива.


let fruitBasket = ["Apple": 25, "Orange": 10, "Pear": 13, "Banana": 9]

let getMassiv: ([Int]) -> () = { value in //value - это переданный в замыкание массив
    var sum = 0
    for i in value {
        sum += i
    }
    print("Первый вызов: сумма элементов в массиве - \(sum)")
}


func getDict(dict: [String: Int], s: ([Int]) -> ()) { //функция, котораяп ринимает словарь и замыкание
    var arrayValue: [Int] = [] // объявляем пустой массив
    for (key, value) in dict { //пробегаемся циклом по словарь
        arrayValue.append(value) //вытаскиваем из словаря значения и вставляем их в массив
    }
    if !arrayValue.isEmpty { //если массив не пустой
        s(arrayValue) // передаем массив в кложуру, где уже считается сумма элементов в массиве
    } else {
        print("Массив пуст")
    }
}

getDict(dict: fruitBasket, s: getMassiv)

getDict(dict: fruitBasket) { value in
    var sum = 0
    for i in value {
        sum += i
    }
    print("Второй вызов: сумма элементов в массиве - \(sum)")
}
