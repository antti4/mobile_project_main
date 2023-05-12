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
        VStack() {
            FindAllButton(workAround: workAround, myURL: myURL)
            FindByIdButton(workAround: workAround, myURL: myURL)
            Spacer()
            UpdateButton(workAround: workAround, myURL: myURL)
            DeleteButton(workAround: workAround, myURL: myURL)
            PostButton(workAround: workAround, myURL: myURL)
        }
        .navigationTitle("Dummy API")
        }
    }


