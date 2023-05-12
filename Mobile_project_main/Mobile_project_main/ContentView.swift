//
//  ContentView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var workAround = WorkAround()
    let myURL = "https://dummyjson.com/users/"
    var body: some View {
        NavigationStack{
            List{
                NavigationLink("see all"){
                    FindAllButton(workAround: workAround, myURL: myURL)
                }
                NavigationLink("find user"){
                    FindByIdButton(workAround: workAround, myURL: myURL)
                }
                NavigationLink("udate user"){
                    UpdateButton(workAround: workAround, myURL: myURL)
                }
                NavigationLink("delete user"){
                    DeleteButton(workAround: workAround, myURL: myURL)
                }
                NavigationLink("create user"){
                    PostButton(workAround: workAround, myURL: myURL)
                }
            }
        }
        .navigationTitle("Dummy API")
    }
}


