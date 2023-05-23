//
//  ContentView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import SwiftUI
import AlertToast
/**
 The main view of the application, responsible for displaying the user interface and managing the state.

 The Main view of a NavigationView containing Vertically stacked subviews with a navigationBar title called "Users"

 The content is surrounded by Spacer views to add some room to the edges
 
 A switch statement is used to conditionally display different subviews based on the value of workAround.buttonNumber
 and as a default a Text view is presented
 
 Below the main content, there is a horizontally stacked buttons for performing different actions.
 The buttons change the value of workaround.buttonNumber so that different subviews can be shown

 The view also utilizes the toast modifier to alert different results based on the values of various variables in workAround
 
 Variables:
    -workAround of type WorkAround: used as a global stateObject throughout the app
    -myUrl of type String: used as the base URL for different http requests
 */
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
                        .foregroundColor(.secondary)
                }
                Spacer()
                HStack{
                    FindAllButton(workAround: workAround, myURL: myURL)
                    FindByIdButton(workAround: workAround)
                    UpdateButton(workAround: workAround)
                }
            }
            .padding(.leading, 10)
            .navigationBarTitle("Users", displayMode: .large)
        }
        .toast(isPresenting: $workAround.showToast){
            AlertToast(type: .regular, title: "Success!")
        }
        .toast(isPresenting: $workAround.notFoundToast){
            AlertToast(type: .regular, title: "Didn't find any items")
        }
        .toast(isPresenting: $workAround.failedRequestToast){
                AlertToast(type: .regular, title: "Request failed")
        }
    }
}


