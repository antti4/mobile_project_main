//
//  PutData.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
/**
 A function for updating data at the specified URL with the given user information.

 The updateData function makes a PUT request to the given URL, updating the given data for the provided user.

 Within the function:
 - the given user info is placed into a json
 - The json  is serialized into JSON data.
 - A URLRequest is created with the provided URL, set to the PUT method, and the JSON data is set as the request's body.
 - The "Content-Type" and "Accept" headers are added to the request to indicate that the data is in JSON format.
 - URLSession is used to perform the PUT request asynchronously.
 - In the completion handler, a JSONDecoder decodes the response data into a Users object.
 - the decoded result is printed, and the workAround.showToast property is set to "true" to display a success toast notification.
 - any error is printed, and the workAround.failedRequestToast property is set to "true" to display a failed request toast notification.
 - The HTTP task is resumed to initiate the network request.
 
    json serialization and httprequest needs their own error handling
 */
func updateData(workAround : WorkAround, url : String, user: Users){
    
    var json = [String:Any]()
    json["firstName"] = user.firstName
    json["lastName"] = user.lastName
    do{
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let httpTask = URLSession.shared.dataTask(with: request){
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
    }catch{
        print(error)
        
    }
}
