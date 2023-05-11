//
//  WorkAround.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation

class WorkAround : ObservableObject {
    @Published var buttonNumber = 0
    @Published var users : Array<Users>? = nil
    @Published var user : Users? = nil
    @Published var notFound : Bool = true
    struct Result: Decodable  {
        let users : [Users]
    }
}
