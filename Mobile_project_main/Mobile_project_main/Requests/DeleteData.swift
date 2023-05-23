//
//  DeleteData.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI
func deleteData(workAround : WorkAround, url : String){
    @State var showtoast : Bool = false
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
