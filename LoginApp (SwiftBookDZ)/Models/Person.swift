//
//  Person.swift
//  LoginApp (SwiftBookDZ)
//
//  Created by Vlad Sytnik on 03.06.2022.
//

import Foundation


//MARK: - Модель
struct Person {
    let name: String
    let username: String
    let password: String
    
    init(name: String, username: String, password: String) {
        self.name = name
        self.username = username
        self.password = password
        addNewPerson()
    }
}


//MARK: - Сохранение в память
extension Person {
    
    private static var registratedPersons: [String: [String]] = [:]
  
    private func addNewPerson() {
        let userDefault = UserDefaults.standard
        Person.registratedPersons =
            userDefault.dictionary(forKey: "persons")
                as? [String: [String]] ?? ["": ["", ""]]
        
        Person.registratedPersons[username] = [password, name]
        
        userDefault.set(Person.registratedPersons, forKey: "persons")
    }
    
}


//MARK: - Ключи для памяти
struct DefaultsKeys {
    static let keyOne = "persons"
}
