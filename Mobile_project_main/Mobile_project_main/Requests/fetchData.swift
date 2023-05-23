//
//  fetchData.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
/**
 A function for fetching data from the specified URL.

 The fetchData function makes a GET request to the given URL and handles the response.

 Within the function:
 - A URL object myURL is created with the provided URL string.
 - A URLSession is used to perform the GET request asynchronously.
 
 - In the completion handler, a JSONDecoder decodes the response data into an array of Users objects.
 - If the decoding is successful, the users variable in workAround is updated with the decoded users.
 - The notFound variable in workAround is set to false to indicate that items were found.
 - any error is printed, and the workAround.failedRequestToast property is set to "true" to display a failed request toast notification.
 - The HTTP task is resumed to initiate the network request.
 */
func fetchData(workAround : WorkAround, url : String){
    let myURL = URL(string : url)!
    let httpTask = URLSession.shared.dataTask(with: myURL) {
     (optionalData, response, error) in
        let jsonDecoder = JSONDecoder()
            do {
                let result = try jsonDecoder.decode(WorkAround.Result.self, from: optionalData!)
                DispatchQueue.main.async() {
                    workAround.users = result.users
                    workAround.notFound = false
                }
            } catch {
                print(error)
            }
    }
    httpTask.resume()
}
