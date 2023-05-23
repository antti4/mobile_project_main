//
//  Users.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
/**
    The Users struct is used to parse a json item requested from the api into a usable form using the decodable protocol
    showing only the values for:
    -id an unique identification code
    -firstName, the first given name of an user
    -lastName the surname of an user
 */
struct Users : Decodable, Identifiable, Hashable {
    var id : Int
    var firstName : String
    var lastName : String
}
