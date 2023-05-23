//
//  PutData.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
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
