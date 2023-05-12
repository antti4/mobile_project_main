//
//  PostData.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
func postData(user:Users, url: String) {
        
        // server endpoint
        let endpoint = url
        
        let endpointUrl = URL(string: endpoint)!
    
        //Make JSON to send to send to server
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
                } catch {
                    print(error)
                }
            }
            httpTask.resume()
        }catch{
            print(error)
        }
    }
