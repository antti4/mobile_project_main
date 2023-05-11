//
//  FindByIdButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI

struct FindByIdButton: View {
    @ObservedObject var workAround : WorkAround
    let myURL = "https://dummyjson.com/users/"
    @State private var bind : Int = 1
    var body: some View {
        VStack {
            if (workAround.users == nil) {
                TextField(
                        "place id",
                        value: $bind,
                        formatter: NumberFormatter()
                    )
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
                Button("Search by id"){
                    fetchData(workAround : workAround, url : "\(myURL)")
                    workAround.buttonNumber = 2
                }
            }else if(workAround.buttonNumber == 2){
                List{
                    ForEach(workAround.users!, id: \.firstName) { user in
                        if(Int(user.id) == bind){
                            Text("\(user.firstName) \(user.lastName)")
                                .padding()
                                .cornerRadius(20)
                        }
                    }
                }
                BackButton(workAround: workAround)
            }
        }
        .padding()
    }
}
