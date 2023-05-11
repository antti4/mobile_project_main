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
                FindAllButton()
            }
        .navigationTitle("Dummy API")
        }
    }


