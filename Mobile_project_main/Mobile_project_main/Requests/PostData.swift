//
//  PostData.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
/**
 A function for posting data to the specified URL with the given user information.

 The postData function makes a POST request to the specified URL, sending the user information in the request body.

 Within the function:
 - user information is placed into a json
 - The json is serialized into JSON data.
 - A URLRequest is created with the provided URL and set to the POST method.
 - The "Content-Type" and "Accept" headers are added to the request to indicate that the data is in JSON format.
 - A URLSession is used to perform the POST request asynchronously.
 - In the completion handler, a JSONDecoder decodes the response data into a Users object.
 - the decoded result is printed, and the workAround.showToast property is set to "true" to display a success toast notification.
 - any error is printed, and the workAround.failedRequestToast property is set to "true" to display a failed request toast notification.
 - The HTTP task is resumed to initiate the network request.
 */
func postData(user:Users, url: String, workAround : WorkAround) {
        
        let endpointUrl = URL(string: url)!
    
        var json = [String:Any]()
        json["firstName"] = user.firstName
        json["lastName"] = user.lastName
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            
            var request = URLRequest(url: endpointUrl)
            request.httpMethod = "POST"
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
                }
            }
            httpTask.resume()
        }catch{
            print(error)
            DispatchQueue.main.async {
                workAround.failedRequestToast = true
            }
        }
    }
