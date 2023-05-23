//
//  FetchById.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation

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
                    workAround.notFound = false
                }
            } catch {
                print(error)
            }
    }
    httpTask.resume()
}
