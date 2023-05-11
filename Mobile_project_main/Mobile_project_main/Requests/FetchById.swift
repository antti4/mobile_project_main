//
//  FetchById.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation

func fetchDataById(workAround : WorkAround, url : String){
    let myURL = URL(string : url)!
    let httpTask = URLSession.shared.dataTask(with: myURL) {
     (optionalData, response, error) in
        let jsonDecoder = JSONDecoder()
            do {
                let result = try jsonDecoder.decode(Users.self, from: optionalData!)
                DispatchQueue.main.async() {
                    workAround.user = result
                    workAround.notFound = false
                }
            } catch {
                print(error)
            }
    }
    httpTask.resume()
}
