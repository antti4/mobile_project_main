//
//  FetchById.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
/**
 A function for fetching data by using the http query

 The fetchDataById function makes a GET request to the given URL with the query parameter and handles the response.

 Within the function:
 - A URL object myURL is created with a modified URL string with spaces replaced into the "+" character.
 - URLSession is used to perform the GET request asynchronously.
 - In the completion handler, a JSONDecoder decodes the response data into an array of Users objects.
 - If the decoding is successful, the Users variable in workAround is updated with the decoded users.
 - If no users are found (the count is 0), the notFoundToast variable in workAround is set to true to display a toast notification.
 - The notFound variable in workAround is set to false to indicate that items were found.
 - any error is printed, and the workAround.failedRequestToast property is set to "true" to display a failed request toast notification.
 - The HTTP task is resumed to initiate the network request.
 */
func fetchDataById(workAround : WorkAround, url : String){
    let trueUrl = url.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
    let myURL = URL(string : trueUrl)!
    let httpTask = URLSession.shared.dataTask(with: myURL) {
     (optionalData, response, error) in
        let jsonDecoder = JSONDecoder()
            do {
                let result = try jsonDecoder.decode(WorkAround.Result.self, from: optionalData!)
                DispatchQueue.main.async() {
                    workAround.users = result.users
                    if(workAround.users!.count == 0){
                        DispatchQueue.main.async {
                            workAround.notFoundToast = true
                        }
                    }
                    workAround.notFound = false
                }
            } catch {
                print(error)
                workAround.failedRequestToast = true
            }
    }
    httpTask.resume()
}
