// ДЗ 6 - Tuples / кортежи
//
//Создать 5 разных Tuples с различными типами данных. Один из них должен содержать все месяца года на русском. Второй на английском
let tuple1 = (Month1: "Январь", Month2: "Февраль", Month3: "Март", Month4: "Апрель", Month5: "Май", Month6: "Июнь", Month7: "Июль", Month8: "Август", Month9: "Сентябрь", Month10: "Октябрь", Month11: "Ноябрь", Month12: "Декабрь")
let tuple2 = ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
let tuple3 = (2002, 2003, 2004, 2005)
let tuple4 = ("Gabi", 7, true, 4.5)



//Распечатать Tuples 3мя различными способами

// 1 способ - вывод всего тюпла/кортежа
print(tuple1)

// 2 способ - вывести элемент по индексу

print(tuple1.0, tuple1.11, tuple1.2)

// 3 способ - по имени элемента. В кортежах мы можем задавать имена, например, Month6 и потом обращаться к элементам по этому имени

print(tuple1.Month11)

//Создать пустой Tuples

let emptyTuple: () = ()
