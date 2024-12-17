//Необходимо создать базовый класс Element, от которого в дальнейшем будут наследоваться другие элементы: кнопки, лейблы, страницы и тд
//Этот элемент должен содержать только одно поле - accessibilityIdentifier
//По этому полю как раз и будем искать элемент с нужны идентификатором

import Foundation


/*Написать Label, Button, TextField, BasePage которые будут наследниками от Element. Но также, у них должны быть какие-то свои особенные свойства или методы. Например, у кнопки будет метод нажатия tap. По которому что-то будет печататься в консоль. А BasePage должен быть контейнером, в котором будет храниться массив с Element’ами
Будем писать автотест на экран ProfilePage. Этот экран является наследником от BasePage
Прежде чем писать автотест, нужно наполнить экран элементами. Иерархия будет следующей:

ProfilePage
|—— <Icon> iconName = “login_icon”
      |—— <Label> text = “Вход”; identificator = “login-label”;
      |—— <TextField> placeholder = “Логин”; text = “”; identificator = “login-input-textfield”; isSecured = false
      |—— <TextField> placeholder = “Пароль”; text = “”; identificator = “password-input-textfield”; isSecured = true
      |—— <Button> identificator = “cool-button-1”; *можно сделать tap по кнопке*
          |—— <Icon> iconName = “question”
      |—— <Button> identificator = “cool-button-2”; *можно сделать tap по кнопке*
          |—— <Icon> iconName = “lock”
       |—— <Label> text = “Войти”; identificator = “button-login-label”;
      |—— <Button> identificator = “close-button”; *можно сделать tap по кнопке*
          |—— <Icon> iconName = “close”
      |—— <Label> text = “Закрыть”; identificator = “button-close-label”;


Далее. Необходимо написать автотест на кейс:

  1. Необходимо в профиле ввести логин и пароль

  2. Нажать на кнопку Войти (должно что-то напечататься в консоль)

  3. Подождать 3 секунды

  4. Нажать на кнопку Закрыть (должно что-то напечататься в консоль)
 */

class Element {
    let accessibilityIdentifier: String
    
    init(accessibilityIdentifier: String) {
        self.accessibilityIdentifier = accessibilityIdentifier
    }
}

class BasePage: Element {
    var elements: [Element] = []
    
    func appendelements(element: Element) {
        self.elements.append(element)
    }
}

class Label: Element {
    func tap() {
        print("Button tap")
    }
}


class Button: Element {
    let label: Label?
    func tap() {
        print("Button tapped")
    }
    
    init(accessibilityIdentifier: String, label: Label?) {
        self.label = label
        super.init(accessibilityIdentifier: accessibilityIdentifier)
    }
}


class TextField: Element {
    func enterLogin(login: String) {
        print("Вы ввели логин \(login)")
    }
    
    func enterPassword(pass: String) {
        print("Вы ввели пароль")
    }
}


class ProfilePage: BasePage {

    
}

let basepage = BasePage(accessibilityIdentifier: "basepage")
let profilepage = ProfilePage(accessibilityIdentifier: "profile")

let label = Label(accessibilityIdentifier: "login-label")
let textFieldByLogin = TextField(accessibilityIdentifier: "login-input-textfield")
let textFieldByPassword = TextField(accessibilityIdentifier: "password-input-textfield")
let buttonQuestion = Button(accessibilityIdentifier: "cool-button-1", label: nil)
let buttonLock = Button(accessibilityIdentifier: "cool-button-2", label: Label(accessibilityIdentifier: "button-login-label"))
let buttonClose = Button(accessibilityIdentifier: "close-button", label: Label(accessibilityIdentifier: "button-close-label"))



profilepage.appendelements(element: label)
profilepage.appendelements(element: textFieldByLogin)
profilepage.appendelements(element: textFieldByPassword)
profilepage.appendelements(element: buttonQuestion)
profilepage.appendelements(element: buttonLock)
profilepage.appendelements(element: buttonClose)

print(profilepage.elements)

//автотест

for i in profilepage.elements {
    switch i {
    case let value as TextField where value.accessibilityIdentifier == "login-input-textfield":
        value.enterLogin(login: "salfetka5")
    case let value as TextField where value.accessibilityIdentifier == "password-input-textfield":
        value.enterPassword(pass: "123456")
    case let value as Button where value.label?.accessibilityIdentifier == "button-login-label":
        value.tap()
        //подождать 3 секунды?
    case let value as Button where value.accessibilityIdentifier == "close-button":
            value.tap()
    default:
        break
    }
}

