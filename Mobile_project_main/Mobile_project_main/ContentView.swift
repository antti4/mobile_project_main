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
            FindByIdButton(workAround: workAround)
            PostButton(workAround: workAround)
        }
        .navigationTitle("Dummy API")
        }
    }


