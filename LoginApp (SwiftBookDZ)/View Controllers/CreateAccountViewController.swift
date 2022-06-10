//
//  CreateAccountViewController.swift
//  LoginApp (SwiftBookDZ)
//
//  Created by Vlad Sytnik on 03.06.2022.
//

import UIKit

class CreateAccountViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Properties
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    let userDefault = UserDefaults.standard
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.addTarget(self,
                                    action: #selector(pushOnUserNameTextField),
                                    for: .allEvents)
        
        self.nameTextField.delegate = self
    }
    

    //MARK: - Actions
    @IBAction func createButton(_ sender: Any) {
        guard let newName = nameTextField.text else {return}
        guard let newUsername = userNameTextField.text else {return}
        guard let newPassword = passwordTextField.text else {return}
        
        var personsDictionary = userDefault.dictionary(forKey: "persons") as? [String: [String]] ?? ["": ["", ""]]
        
        var usernames = personsDictionary.map { (key: String, value: [String]) in
            key
        }
        
        // Проверка на пустые поля
        if newName == "" || newUsername == "" || newPassword == "" {
            createAlertForEmptyTextField()
            return
        }
        
        // Проверка на создание уже существующего пользователя
        guard !usernames.contains(newUsername) else {
            createErrorAlert()
            return
        }
        
        _ = Person(name: newName,
               username: newUsername,
               password: newPassword
        )
        
        personsDictionary = userDefault.dictionary(forKey: "persons") as? [String: [String]] ?? ["": ["", ""]]
        usernames = personsDictionary.map { (key: String, value: [String]) in
            key
        }
        
        // Если пользователь успешно создан
        if usernames.contains(newUsername) {
            createSuccessfullAlert()
            
            let story = UIStoryboard(name: "Main", bundle: nil)
            let vc = story.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
            
            vc?.labelText = "Пожалуйста, авторизируйтесь"
        }
    }
    
    
    // MARK: - Selectors
    @objc func pushOnUserNameTextField() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  self.nameTextField.tintColor = UIColor.blue
        }
    }
    
    
    //MARK: - Functions
    func createErrorAlert() {
        let message = "Пользователь с таким username уже существует"
        
        let alert = UIAlertController(title: "Произошла ошибка",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Попробовать еще раз",
                                   style: .default) { _ in
            self.userNameTextField.text = ""
            self.nameTextField.text = ""
            self.passwordTextField.text = ""
            self.nameTextField.tintColor = UIColor.clear
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func createSuccessfullAlert() {
        let title = "Вы успешно зарегистрировались!"
        
        let alert = UIAlertController(title: title,
                                      message: "👾",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Продолжить", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func createAlertForEmptyTextField() {
        let message = "Заполните, пожалуйста, поля"
        
        let alert = UIAlertController(title: "Упс!",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Окей", style: .default)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Delegate Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }

    
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
