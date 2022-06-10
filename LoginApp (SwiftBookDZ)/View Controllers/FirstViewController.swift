//
//  ViewController.swift
//  LoginApp (SwiftBookDZ)
//
//  Created by Vlad Sytnik on 03.06.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var labelForSignalReturnSignIn: UILabel!
    
    var labelText = ""
    
    let defaultVar = UserDefaults.standard
    let story = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        labelForSignalReturnSignIn.text = labelText
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    //MARK: - Actions
    @IBAction func LogIn(_ sender: Any) {
        guard let currentUsername = usernameTextField.text else {return}
        guard let currentPassword = passwordTextField.text else {return}
        
        let usersDictionary = defaultVar.dictionary(forKey: "persons") as? [String: [String]] ?? ["": ["", ""]]
        
        let usernames = usersDictionary.map { (key: String, value: [String]) in
            key
        }
        
        // Проверка на пустые поля
        if currentUsername == "" || currentPassword == "" {
            createErrorAlertForClearTextLabel()
            return
        }
        // Проверка на существующего пользователя
        guard usernames.contains(currentUsername) else {
            createErrorAlert()
            return
        }
        // Проверк на соответствие пароля
        guard currentPassword == usersDictionary[currentUsername]?[0] else {
            createAlertForFaulurePassword()
            return
        }
        
        guard let vcTabBar = story.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else { return }
        
        let nameWithoutFormating = usersDictionary[currentUsername]?[1] ?? "nil"
        let name = firstCharInUpperCase(in: nameWithoutFormating)
        
        WelcomeViewController.textLabel = "Welcome, \(name)!"
        MoreInfoViewController.textLabel = name
        
        show(vcTabBar, sender: nil)
        
        // Задержка
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.usernameTextField.text = ""
            self.passwordTextField.text = ""
        }
    }
    
    
    //MARK: - Functions
    func createErrorAlert() {
        let alert = UIAlertController(title: "Произошла ошибка",
                                      message: "Пользователя с таким username не существует",
                                      preferredStyle: .alert)
        
        
        
        alert.addAction(UIAlertAction(title: "Попробовать еще раз",
                                      style: .default
                                     ) { _ in
            self.usernameTextField.text = ""
            self.passwordTextField.text = ""
        }
        )
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func createErrorAlertForClearTextLabel() {
        let alert = UIAlertController(title: "😿",
                                      message: "Заполните поля username и password",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Заполнить",
                                   style: .default)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func createAlertForFaulurePassword() {
        let alert = UIAlertController(title: "Упс!",
                                      message: "Неверный пароль",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Попробовать еще раз",
                                   style: .default)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func firstCharInUpperCase(in str: String) -> String{
        var newName = ""
        str.forEach() { char in
            if char == str.first {
                newName.append(char.uppercased())
            } else {
                newName.append(char)
            }
        }
        return newName
    }
    
}


//MARK: - Extentions
extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            self.LogIn((Any).self)
        }
        return true
    }
}

