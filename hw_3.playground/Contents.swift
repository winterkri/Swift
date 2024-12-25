//ДЗ 3
//Создать свои строки
var myStr = "zima"
var myStr1: String = "Hej"

//Создать различные выражения с приведением типа
var intgr: Int = 50
var str3: String = "Cent"

String(intgr) + " " + str3

//Поработать с циклом for in, как было в ютюб уроке

for i in "winter" {
    print(i)
}



// Убираем определенный символ из строки
for i in "Lorem Ipsum Dolorem" {
    if i == "o" {
    continue
    }
    print(i)
}


var stroka = "i love testing"
stroka.count // считаем кол-во букв в строке
