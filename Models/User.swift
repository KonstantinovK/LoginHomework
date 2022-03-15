//
//  user.swift
//  LoginHomework
//
//  Created by MacBook on 15.03.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person

static func getUserData() -> User {
    User(
        login: "user",
        password: "password",
        person: .getPerson()
    )
}
}

struct Person {
    let name: String
    let surname: String
    let image: String
    let hobby: String
    let work: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    static func getPerson() -> Person {
        Person(name: "Konstantin", surname: "Konstantinov", image: "SwiftImage", hobby: "Play in footbal!", work: "IT manager")
    }
}
