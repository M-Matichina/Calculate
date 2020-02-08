//
//  ViewController.swift
//  Calculate
//
//  Created by Мария Матичина on 8/1/19.
//  Copyright © 2019 Мария Матичина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var allClean: UIButton!
    @IBOutlet weak var plusMinus: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var equally: UIButton!
    @IBOutlet weak var point: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var topView: UIView!
    
    
    //
    
    var resString = ""
    var firstNumber = "0"
    var operation = ""
    var secondNumber = ""
    var isEnterFirstNumber = true // это твой флаг (либо тру, либо фолс)
    var isHaveResult = false
    
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // deleteBtn.setImage(UIImage(named: «имя файла»), .normal) код на чтобы кнопка back была белой
        
        // setimage -  установить фото к конопке
        // withRenderingMode(.alwaysTemplate) - режим рендера (изменения) фотки
        // for: .normal - в какое состояние установить
        // template - шаблон
        // tint -  оттенок
        delete.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        delete.tintColor = .white
 
        setGradientBackground()
    }
    
    
    // давай так
    // 5 + 5 = 10
    // дальше вводишь цифры
    // должны удалить 1 число, 2 число, опеацию (т.е сделать cleanAll) в момент, когда после равно нажали кнопку с цифрой
    // тебе нужно понять, если ли результат готовый на экране, для этого создать переменную isHaveResult = false
    // когда нажимаешь равно, то isHaveResult должен быть true
    // по этому флагу и определим есть число или нет
    
    
    
    // MARK: - Calculate
    
    func tapNumber(_ number: Int) {
        
        // нажимаешь кнопку с цифрой, передаешь сюда значение
        
        // алгоритм напишем,
        
        // если у нас резалт == 0 и мы нажимаем цифру, то нам резулт надо перезаписать дальше
        
        if result.text == "0" { // // при удалении второго числа должен быть 0, а не ""(пустота)
            result.text = "\(number)" // надо проверить, если result == 0 и нет операции, то 0 надо удалить, а на его место новую цифру
        }
        //if isHaveResult == true { если был результат - очищали, а сейчас еще проверка операции идет
        if isHaveResult == true && operation == "" { // если тут тру, то очищаешь все, а дальше твой код уже все сделает сам sи цифру присвоит куда нужноо
            cleanOperationData()
        }
        
        // пока не понятно
        if isHaveResult == true && operation != "" && isEnterFirstNumber == false {
            secondNumber = "" // * 2 число очищается
            isHaveResult = false // т.к совершаем новую операцию, то о существовании результата можно забыть
            
            // *
            // то 2 число приравниваем к пустоте (очищаем) 1+3=4 т.е 3 удалилось
            // var firstNumber1 = "1"
            // var secondNumber1 = "2"
            // firstNumber1 = Int(firstNumber1) + (secondNumber1)
            // secondNumber1 = secondNumber1 + "5" // "25"
            // secondNumber1 = ""
            // secondNumber1 = secondNumber1 + "5" // "5"
        }
        
        // if isEnterFirstNumber = "0" {
        // firstNumber += "\(number)"
        
        if isEnterFirstNumber == true && firstNumber.count < 9 { // проверяем какое число вводим 1 или 2, если isEnterFirstNumber равен true, значит вводим 1 число
            if firstNumber == "0" && Int(number) == Int(0) { // если первое число равно 0 и число, на которое ты сейчас нажала == 0 то, ничего не делаем, пустое тело
            } else if firstNumber == "0" && Int(number) > Int(0) { // если первое число равно 0 и число, на которое ты сейчас нажала больше 0, то firstNumber = "\(number)" - заменяем число, на твою цифру, которую ты нажала
                firstNumber = "\(number)"
            } else {
                firstNumber += "\(number)" // в остальных случаях прибавляем (было 0, нажали 1 стало 1, нажала 2 стало 12)
            }
            result.text = numberFormat(number:Double(firstNumber) ?? 0)
        } else if secondNumber.count < 9 && isEnterFirstNumber == false {
            if secondNumber == "0" && Int(number) == Int(0) {
            } else if secondNumber == "0" && Int(number) > Int(0) {
                secondNumber = "\(number)"
            } else {
                secondNumber += "\(number)"
            }
            result.text = numberFormat(number:Double(secondNumber) ?? 0)
        }
    }
    
    // MARK: - Actions
    
    
    @IBAction func zeroAction(_ sender: Any) {
        tapNumber(0)
    }
    
    @IBAction func oneAction(_ sender: Any) {
        tapNumber(1)
    }
    
    @IBAction func twoAction(_ sender: Any) {
        tapNumber(2)
    }
    
    @IBAction func threeAction(_ sender: Any) {
        tapNumber(3)
    }
    
    @IBAction func fourAction(_ sender: Any) {
        tapNumber(4)
    }
    
    @IBAction func fiveAction(_ sender: Any) {
        tapNumber(5)
    }
    
    @IBAction func sixAction(_ sender: Any) {
        tapNumber(6)
    }
    
    @IBAction func sevenAction(_ sender: Any) {
        tapNumber(7)
    }
    
    @IBAction func eightAction(_ sender: Any) {
        tapNumber(8)
    }
    
    @IBAction func nineAction(_ sender: Any) {
        tapNumber(9)
    }
    
    
    @IBAction func allCleanAction(_ sender: Any) {
        cleanOperationData()
        result.text = "0"
    }
    
    func cleanOperationData() {
        firstNumber = "0"
        operation = ""
        secondNumber = ""
        isEnterFirstNumber = true // этот флаг означает, что ты вводишь 1 число в случае, если он = true, если он = false значит вводишь второе число
        isHaveResult = false // есть результат - нет, 4+4 = 8 и вводишь дальше цифру 2, как понять, что это новое вычисление?
    }
    
    // весь этот код нужно вынести в отдельную функцию, а отсюда вызвать новую функциию , название cleanAll()
    
    
    @IBAction func plusMinusAction(_ sender: Any) {
        
        if isHaveResult == true {
            var value = Double(firstNumber) ?? 0
            value = -value
            firstNumber = "\(value)"
            var valStr = "\(value)"
            valStr = numberFormat(number:Double(valStr) ?? 0)
            if valStr.suffix(2) == ".0" {
                result.text = String(valStr.dropLast(2))
                return
            } else {
                result.text = valStr
                return
            }
            
        }
        // тут так, проверка второе число не пустое?, тогда его пишем с противоположным знаком, т.е умножаем на (-1)
        // если второе пусто, то смотрим не пусто ли первое число и умножаем его на (-1)
        // и записываем само в себя 1в1, 2в2
        if secondNumber != "" {
            var value = Double(secondNumber) ?? 0
            value = -value
            secondNumber = "\(value)"
            var valStr = "\(value)"
            valStr = numberFormat(number:Double(valStr) ?? 0)
            if valStr.suffix(2) == ".0" {
                result.text = String(valStr.dropLast(2))
            } else {
                result.text = valStr
            }
        } else if firstNumber != "0" {
            var value = Double(firstNumber) ?? 0
            value = -value
            firstNumber = "\(value)"
            var valStr =  "\(value)"
            valStr = numberFormat(number:Double(valStr) ?? 0)
            if valStr.suffix(2) == ".0" {
                result.text = String(valStr.dropLast(2))
            } else {
                result.text = valStr
            }
        }
    }
    
    @IBAction func percentAction(_ sender: Any) {
        
        if isHaveResult == true { // если есть результат, то выходишь из функии (return) так как удалить результат нельзя, только очистить
            var valueTwo = Double(firstNumber) ?? 0
            valueTwo = valueTwo / 100
            firstNumber = "\(valueTwo)"
            var valTwoStr = "\(valueTwo)"
            valTwoStr = numberFormat(number:Double(valTwoStr) ?? 0)
            if valTwoStr.suffix(2) == ".0" {
                result.text = String(valTwoStr.dropLast(2))
                return
            } else {
                result.text = valTwoStr
                return
            }
        }
        // secondNumber - строка
        // valueTwo - число
        // из строки нужно сделать число, разделить на 100 и записать опять в строку
        if secondNumber != "" {
            var valueTwo = Double(secondNumber) ?? 0
            valueTwo = valueTwo / 100
            secondNumber = "\(valueTwo)"
            var valTwoStr = "\(valueTwo)"
            valTwoStr = numberFormat(number:Double(valTwoStr) ?? 0)
            if valTwoStr.suffix(2) == ".0" {
                result.text = String(valTwoStr.dropLast(2))
            } else {
                result.text = valTwoStr
                // secondNumber = valStr
            }
        } else if firstNumber != "" {
            var valueTwo = Double(firstNumber) ?? 0
            valueTwo = valueTwo / 100
            firstNumber = "\(valueTwo)"
            var valTwoStr = "\(valueTwo)"
            valTwoStr = numberFormat(number:Double(valTwoStr) ?? 0)
            if valTwoStr.suffix(2) == ".0" {
                result.text = String(valTwoStr.dropLast(2))
            } else {
                result.text = valTwoStr
                isHaveResult = true // результат может быть у первого числа 8 % = 0,08
            }
        }
    }
    
    @IBAction func divisionAction(_ sender: Any) {
        if firstNumber != "" && secondNumber != "" {
            operation = "/"
            equallyAction(sender)
            return
        }
        
        if firstNumber != "" {
            operation = "/"
            isEnterFirstNumber = false
            
            // У тебя нет 1-го числа, нет операции, нет 2-го числа
            // Нажимаешь цифры 123
            // 123 это первое число, записываешь
            // Как понять, что будешь вводить второе число?
            // В момент операции меняется флаг
        }
    }
    
    @IBAction func multiplicationAction(_ sender: Any) {
        if firstNumber != "" && secondNumber != "" {
            if isHaveResult == true {
                secondNumber = ""
            }
            operation = "*"
            equallyAction(sender)
            return
        }
        
        if firstNumber != "" {
            operation = "*"
            isEnterFirstNumber = false
        }
    }
    
    @IBAction func minusAction(_ sender: Any) {
        if firstNumber != "" && secondNumber != "" { // чтобы ввести 7+1+2=10, а не 7+13
            if isHaveResult == true {
                secondNumber = ""
            }
            operation = "-"
            equallyAction(sender)
            return
        }
        
        if firstNumber != "" {
            operation = "-"
            isEnterFirstNumber = false
        }
    }
    
    @IBAction func plusAction(_ sender: Any) {
        
        if firstNumber != "" && secondNumber != "" {
            if isHaveResult == true {
                secondNumber = ""
            }
            operation = "+"
            equallyAction(sender) // вызываем функцию =, знак +, чтобы было 1+2+3+4...
            return // return можно писать, а можно не писать. (2 операция (код) не обязательны к выполнению)
        }
        
        if firstNumber != "" { // смотришь, первое число есть, если да, выполняешь след
            operation = "+" // записываешь знак операции
            isEnterFirstNumber = false // переключаешь флаг на ввод 2 числа т.е. если он тру, значит вводим 1 число, если фолс, значит вводим второе
        }
    }
    
    @IBAction func equallyAction(_ sender: Any) {
        
        // делаешь проверку, что есть 2 числа и операция
        if firstNumber != "" && secondNumber != "" && operation != "" {
            
            switch operation {
            case "+":
                let res = (Double(firstNumber) ?? 0) + (Double(secondNumber) ?? 0) // складываешь 2 числа
                var resStr = "\(res)"
                // удаляем ноль с конца
                resStr = numberFormat(number:Double(resStr) ?? 0)
                if resStr.suffix(2) == ".0" { // suffix - берем значения с конца
                    result.text = String(resStr.dropLast(2)) // dropLast удаляет последний элемент // пример someArray.dropLast()
                } else {
                    result.text = resStr // показываешь результат на экране
                }
                isEnterFirstNumber = false // т.к к результату можно прибавить что-то, значит переключаешь флаг
                firstNumber = "\(res)"
                isHaveResult = true // когда = нажала у тебя очищается secondNumber и операция
                break
            case "-":
                let res = (Double(firstNumber) ?? 0) - (Double(secondNumber) ?? 0)
                result.text = "\(res)"
                var resStr = "\(res)"
                resStr = numberFormat(number:Double(resStr) ?? 0)
                if resStr.suffix(2) == ".0" {
                    result.text = String(resStr.dropLast(2))
                } else {
                    result.text = resStr
                }
                isEnterFirstNumber = false
                firstNumber = "\(res)"
                isHaveResult = true
                break
            case "*":
                // 2 * 3 % = 0.06  =  Double
                let res = (Double(firstNumber) ?? 0) * (Double(secondNumber) ?? 0)
                result.text = "\(res)"
                var resStr = "\(res)"
                resStr = numberFormat(number:Double(resStr) ?? 0)
                if resStr.suffix(2) == ".0" {
                    result.text = String(resStr.dropLast(2))
                } else {
                    result.text = resStr
                }
                isEnterFirstNumber = false
                firstNumber = "\(res)"
                isHaveResult = true
                break
            case "/":
                if secondNumber == "0" {
                    result.text = "ОШИБКА"
                    return
                }
                let res = (Double(firstNumber) ?? 0) / (Double(secondNumber) ?? 0)
                result.text = "\(res)"
                var resStr = "\(res)"
                resStr = numberFormat(number:Double(resStr) ?? 0)
                if resStr.suffix(2) == ".0" {
                    result.text = String(resStr.dropLast(2))
                } else {
                    result.text = resStr
                }
                isEnterFirstNumber = false
                firstNumber = "\(res)"
                isHaveResult = true
            default:
                break
            }
        }
    }
    
    @IBAction func pointAction(_ sender: Any) {
        
        if isEnterFirstNumber == true { // смотрим, вводим ли мы первое число, если да, то
            if firstNumber.contains(".") == false && firstNumber != "" && firstNumber.count <= 7 { // проверяем что не содержится точка в первом числе (строке)
                // secondNumber.count <= 7 - проверка на то что кол-во символов 7 чтобы было так 01234567,02
                // contains() - проверяет, если ли подстрока в строке
                // если есть, вернет true, то ничего не добавляем
                // если нет, вернет false
                // нам нужен false, чтобы добавить точку к концу строки
                firstNumber += "." // прибавляем точку в конец к первой строке
                result.text = firstNumber // отображаем на экране
            }
            
        } else {
            if secondNumber.contains(".") == false && secondNumber != "" && secondNumber.count <= 7 { // проверяем что не содержится точка во втором числе (строке)
                secondNumber += "."
                result.text = secondNumber
            };
        }
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        
        // Нужно понять следующее:
        
        // isEnterFirstNumber - это переменная, которая показывает, какое число ты вводишь первое=(true) или второе=(false)
        
        // firstNumber - это сама число = цифра (оно не тру и не фолс) оно INT
        // secondNumber - это сама число = цифра (оно не тру и не фолс) оно INT
        
        // при проверке if isEnterFirstNumber == true ты проверяешшь, вводишь ли ты первое число
        // при проверке if firstNumber != "" ты проверяешшь, не пусто ли первое число
        
        // Если isEnterFirstNumber == true - то вводится первое число
        // Если isEnterFirstNumber == false - то вводится второе число
        
        if isHaveResult == true { // если есть результат, то выходишь из функии (return) так как удалить результат нельзя, только очистить
            return
        }
        
        if isEnterFirstNumber == true { // Если isEnterFirstNumber == true - то вводится первое число
            // вводишь певрое число да или нет, если да то
            
            if firstNumber.count == 1 { // если кол-во знаков = 1 то firstNumber приравниваем к 0. (т.е. удаляем)
                firstNumber = "0"
                result.text = firstNumber
            } else {
                firstNumber.removeLast()
                result.text = firstNumber
            }
        } else if isEnterFirstNumber == false { // Если isEnterFirstNumber == false - то вводится второе число
            // вводишь певрое число да или нет, если нет то
            if secondNumber.count == 1 {
                secondNumber = "0"
                result.text = secondNumber // надо проверить, если result == 0 и нет операции, то 0 надо удалить, а на его место новую цифру
            } else {
                secondNumber.removeLast()
                result.text = secondNumber
            }
        }
    }
    // MARK: - UI
    
    // по градиенту
    // у тебя есть вью, ей нужно зад;ать цвет фона, но не обычный цвет, а градиент, для этого надо создать градиент
    // создадим функцию, в которой будем создавать градиент и применять его к вью
    // это функция setGradientBackground() - мы сами ее так назвали, могли назвать по другому
    
    func setGradientBackground() { // функция ничего не возвращает и у нее нет входных параметров, она просто что-то делает и все
        
        // у градиента есть цвет начала и цвет конца, да?
        // создаем цвет начала - это колор топ
        // Цвет в RGB - red/green/blue
        // каждый компонент от 0 до 255 или от 0 до 1 диапазон, от 0 до 255 (так принято, стандарт)
        // диапазон от 0 до 1 - это тоже самое что от 0 до 255
        // можно и так UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        // но нельзя смешивать от 0 до 1 и от 0 до 255 что-то одно
        // alpha - это прозрачность, диапазон 0-1
        
        
        
        let colorTop = UIColor(red: 41.0/255.0, green: 169.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor // создаешь переменную первого цвета, цвет создается через UIColor (и дальше компоненты)
        // 17 / 255 = 17 делить на 255 чтобы получить значение от 0 до 1 максимум 255 / 255 = 1
        // есть 3 цвета r/g/b
        // представь, что их смешивают все 3
        // и если один немного поменять, то итоговый тоже поменяется
        // поиграй цветами чтоб понять
        let colorBottom = UIColor(red: 41.0/255.0, green: 78.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor // это для цвета конца, точно также как для цвета начала
        
        let gradientLayer = CAGradientLayer() // core animation // есть стандартный компонент Слой градиента - создаем переменную слоя градиента
        gradientLayer.colors = [colorTop, colorBottom, colorBottom] // у градиента может быть несколько цветов, 2-3-и тд, поэтому записываешь сюда все твои цвета
        gradientLayer.locations = [0.0, 0.8, 1.0] // это позиции цветов, минимум 0, максимум 1  цвет либо равномерно идет, либо нет, давай погуглим, я плохо объясняю location -  это место нахождение мне понятно все
        gradientLayer.frame = self.view.bounds // frame - это границы твоего слоя, координаты и размеры, т.е слой должен быть в том же месте, где вью
        
        self.view.layer.insertSublayer(gradientLayer, at:0) // добавляем слой градиента на вью с помощью insertSublayer
        // at: это позиция слоя, может быть несколько слоев, они накладываются друг на друга, как лист бумаги, sub lyer - подслой
    }
    
    func numberFormat(number:Double) -> String { // функция которая принимает на вход число и преобразует его в строку нужного формата
        // Почему setGradientBackground() вызываем отдельно, а numberFormat вызываем прям тут result.text = numberFormat(number: ЧИСЛО)?
        
        // Для градиента нужно вызвать функцию 1 раз, в момент, когда вью заканчивает загружаться, а форматтер у тебя каждый раз, когда ты выводишь результат на консоль, во всех местах, где есть result.text =
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 7 // Максимальное количество цифр после запятой
        return formatter.string(for: number) ?? "" // Возвращаем наше число, которое передали в функцию в виде преобразованной строки с помощью NumberFormatter()
    }
}

