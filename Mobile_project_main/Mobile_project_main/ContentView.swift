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
        NavigationView{
            VStack{
                Spacer()
                switch workAround.buttonNumber {
                case 1:
                    FindAllView(workAround: workAround)
                case 2:
                    FindByIdView(workAround: workAround)
                default:
                    Text("welcome to users API! Let's get started")
                }
                Spacer()
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        FindAllButton(workAround: workAround, myURL: myURL)
                        FindByIdButton(workAround: workAround, myURL: myURL)
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
            }
            .padding(.leading, 10)
            .navigationBarTitle("Users", displayMode: .large)
        }
    }
}


