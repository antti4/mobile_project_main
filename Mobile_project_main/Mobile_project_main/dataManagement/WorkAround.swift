//
//  WorkAround.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
/**
 The WorkAround class is an ObservableObject that manages the state and data for the application.

 The class defines several @Published variables that are observed and updated when their values change:
 - buttonNumber : Int,  An integer representing the selected button number.
 - users: Array<Users>?,  An optional array of "Users" objects that are fetched from th api
 - user: An optional "Users" object that is used when a single user is expected from a response
 - notFound: A boolean value indicating that the request has not yet been fulfilled
 - myUrl: String: used as the base URL for different http requests
 - showToast: A boolean value indicating whether to show a success toast notification.
 - notFoundToast: A boolean value indicating whether to show a toast notification for not finding any items.
 - failedRequestToast: A boolean value indicating whether to show a toast notification for a failed request.

 The Result struct is used to parse a json array requested from the api into an usable form using the decodable protocol
 */
class WorkAround : ObservableObject {
    @Published var buttonNumber = 0
    @Published var users : Array<Users>? = nil
    @Published var user : Users? = nil
    @Published var notFound : Bool = true
    @Published var myUrl : String = "https://dummyjson.com/users/"
    @Published var showToast : Bool  = false
    @Published var notFoundToast : Bool = false
    @Published var failedRequestToast : Bool = false
    struct Result: Decodable  {
        let users : [Users]
    }
}
