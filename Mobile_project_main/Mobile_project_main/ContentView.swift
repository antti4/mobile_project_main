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
                case 3:
                    UpdateView(workAround: workAround)
                case 4:
                    DeleteView(workAround: workAround)
                case 5:
                    PostView(workAround: workAround)
                default:
                    Text("welcome to users API! Let's get started")
                }
                Spacer()
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        FindAllButton(workAround: workAround, myURL: myURL)
                        FindByIdButton(workAround: workAround, myURL: myURL)
                        UpdateButton(workAround: workAround)
                        DeleteButton(workAround: workAround)
                        PostButton(workAround: workAround)
                    }
                }
            }
            .padding(.leading, 10)
            .navigationBarTitle("Users", displayMode: .large)
        }
    }
}


