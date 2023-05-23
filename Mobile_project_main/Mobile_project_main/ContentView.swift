//
//  ContentView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import SwiftUI
import AlertToast

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
                    EditBackend(workAround: workAround)
                default:
                    Text("welcome to users API! Let's get started")
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack{
                    FindAllButton(workAround: workAround, myURL: myURL)
                    FindByIdButton(workAround: workAround, myURL: myURL)
                    UpdateButton(workAround: workAround)
                }
            }
            .padding(.leading, 10)
            .navigationBarTitle("Users", displayMode: .large)
        }
        .toast(isPresenting: $workAround.showToast){
            AlertToast(type: .regular, title: "Success!")
        }
    }
}


