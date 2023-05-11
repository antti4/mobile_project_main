//
//  ContentView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var workAround = WorkAround()
    let myURL = "https://dummyjson.com/users"
    var body: some View {
        NavigationStack() {
            if (workAround.users == nil) {
                ProgressView().onAppear(){
                    fetchData(workAround : workAround, url : myURL)
                }
            }else{
                List{
                    ForEach(workAround.users!, id: \.firstName) { user in
                        Text("\(user.firstName) \(user.lastName)")
                                    .padding()
                                    .cornerRadius(20)
                    }
                }.navigationTitle("Dummy API")
            }
        }
        .padding()
    }
}


