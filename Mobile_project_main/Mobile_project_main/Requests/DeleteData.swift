//
//  DeleteData.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//
/**
 A function for deleting data from the specified URL.

 The deleteData function makes a DELETE request to the API and handles the response.
 It takes a workAround object and a URL string as parameters.

 Within the function:
 - A URLRequest is created with the provided URL and set to the DELETE method.
 - URLSession is the tool used to perform the HTTP request.
 - if the request is succesful a JSONDecoder decodes the response data into an Users object.
 - the decoded result is printed, and the workAround.showToast property is set to "true" to display a success toast notification.
 - any error is printed, and the workAround.failedRequestToast property is set to "true" to display a failed request toast notification.
 - The HTTP task is resumed to initiate the network request.
 */
import Foundation
import SwiftUI
func deleteData(workAround : WorkAround, url : String){
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = "DELETE"
    let httpTask = URLSession.shared.dataTask(with: request) {
        (optionalData, response, error) in
        let jsonDecoder = JSONDecoder()
        do {
            let result = try jsonDecoder.decode(Users.self, from: optionalData!)
                print(result)
                DispatchQueue.main.async {
                    workAround.showToast = true
                }
        } catch {
            print(error)
            DispatchQueue.main.async {
                workAround.failedRequestToast = true
            }
        }
    }
    httpTask.resume()
}
