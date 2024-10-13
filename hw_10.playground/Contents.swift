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


//Написать функцию, которая принимает пустые массивы(один - строковый, второй - числовой) и проверяет их: если пустой - то добавить значения (любые) и вывести в консоль.


func forEmptyArrays(arrayOne: [String], arrayTwo: [Int]) {
 
    var firstArray = arrayOne
    var secondArray = arrayTwo
    
    if !arrayOne.isEmpty && !arrayTwo.isEmpty {
        print("Массивы не пусты")
    } else if arrayOne.isEmpty && arrayTwo.isEmpty {
        secondArray.append(Int.random(in: 9...100))
        firstArray.append("Kri")
    } else if arrayOne.isEmpty {
        firstArray.append("Bro")
    } else if arrayTwo.isEmpty  {
        secondArray.append(Int.random(in: 5...7))
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
//Далее создайте еще одну функцию, которая будет принимать три параметра: функцию созданную ранее, значение, которое
//планируем увеличивать в два раза и число, которое будет отвечать за количество вызовов, переданной в параметр функции.
//Функция должна выводить следующий результат на консоль: "Operation result after iteration <номер итерации> is: <результат>
//Например если мы захотим 5 раз увеличить число 3, то на консоли мы должны получить следующий результат:


func doubleNum (num: Int) -> Int {
    return num * 2
}

doubleNum(num: 10)


func otherFunc (earlyFunc: (Int) -> Int, znachenie: Int, kolichestvo: Int) {
    var newNum = znachenie // присваиваем переменной newNum значение из znachenie, то есть 11
    for i in 1...kolichestvo {
        newNum = earlyFunc(newNum) // присваиваем получившиеся увеличенное значение znachenie, тем самым увеличиваем newNum
        print("Operation result after iteration \(i) is: \(newNum)")
    }
    
}

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

// Создайте функцию, которая будет принимать в качестве параметров числовой массив и блок замыкания. Данная функция должна
//находить максимальное значение из массива. Блок замыкания должен захватывать это максимальное значение и выводить его на
//консоль. Вызовите три раза данную функцию, при первом вызове в параметр замыкания передайте функцию (создайте ее сами), во
//второй вызов передайте в параметр свойство с типом блока замыкания, и в третий вызов просто раскройте комплишен и реализуйте
//вывод максимального значения на консоль.

