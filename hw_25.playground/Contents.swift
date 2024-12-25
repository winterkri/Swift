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
    var accessibilityIdentifier: String?
    
    init(accessibilityIdentifier: String?) {
        self.accessibilityIdentifier = accessibilityIdentifier
    }
}

// Контейнер, в котором будет храниться массив элементов
class BasePage: Element {
    var elements: [Element] = []
    
    func addElement(element: Element) {
        self.elements.append(element)
    }
}

class Label: Element {
    let text: String?
    
    init(text: String? = nil, accessibilityIdentifier: String?) {
        self.text = text
        super.init(accessibilityIdentifier: accessibilityIdentifier)
    }
}


class Button: Element {
    let label: Label?
    let iconName: String?

    
    func tap() {
        print("Вы нажали на элемент \(self.label?.text ?? "Кнопка")")
    }
    
    init(accessibilityIdentifier: String, label: Label? = nil, iconName: String? = nil) {
        self.label = label
        self.iconName = iconName
        super.init(accessibilityIdentifier: accessibilityIdentifier)
    }
}


class TextField: Element {
    let placeholder: String?
    
    func enterLogin(login: String) {
        print("Вы ввели логин \(login) в инпут \(placeholder ?? "Логин")")
    }
    
    func enterPassword(pass: String) {
        print("Вы ввели пароль в инпут \(placeholder ?? "Пароль")")
    }
    
    init(placeholder: String?, accessibilityIdentifier: String?) {
        self.placeholder = placeholder
        super.init(accessibilityIdentifier: accessibilityIdentifier)
    }
}

class ProfilePage: BasePage {
    let iconName = "login_icon"
    
}

let profilepage = ProfilePage(accessibilityIdentifier: nil)

let label = Label(text: "Вход", accessibilityIdentifier: "login-label")
let textFieldByLogin = TextField(placeholder: "Логин", accessibilityIdentifier: "login-input-textfield")
let textFieldByPassword = TextField(placeholder: "Пароль", accessibilityIdentifier: "password-input-textfield")
let buttonQuestion = Button(accessibilityIdentifier: "cool-button-1", iconName: "question")
let buttonLock = Button(accessibilityIdentifier: "cool-button-2", label: Label(text: "Войти", accessibilityIdentifier: "button-login-label"), iconName: "lock")
let buttonClose = Button(accessibilityIdentifier: "close-button", label: Label(text: "Закрыть", accessibilityIdentifier: "button-close-label"), iconName: "close")


//кладем элементы в контейнер element
profilepage.addElement(element: label)
profilepage.addElement(element: textFieldByLogin)
profilepage.addElement(element: textFieldByPassword)
profilepage.addElement(element: buttonQuestion)
profilepage.addElement(element: buttonLock)
profilepage.addElement(element: buttonClose)


//автотест

for i in profilepage.elements {
    switch i {
    case let value as TextField where value.accessibilityIdentifier == "login-input-textfield":
        value.enterLogin(login: "salfetka5")
    case let value as TextField where value.accessibilityIdentifier == "password-input-textfield":
        value.enterPassword(pass: "123456")
    case let value as Button where value.accessibilityIdentifier == "cool-button-2":
        value.tap()
  Thread.sleep(forTimeInterval: 3)
    case let value as Button where value.accessibilityIdentifier == "close-button":
            value.tap()
    default:
        break
    }
    
}



