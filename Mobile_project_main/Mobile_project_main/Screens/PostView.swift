//
//  PostView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI
/**
 A SwiftUI view for creating a new user.

PostView displays text fields for entering a first name and last name, and a button for creating a new user.

 Within the body of the view:
 - A VStack is used to arrange the two TextFields and a Button vertically.
 - The two TextField views are displayed for entering the first name and last name respectively. The variables firstName and lastName are bound to the text fields with the @State annotation to capture the entered values.
 - A Button is labeled "Post" and when tapped, it creates a new Users object using the entered first name and last name, and calls the postData function to send the user data to the specified URL.
 - The button and TextFields include additional styling options for easier user experience.
 */
struct PostView: View {
    @ObservedObject var workAround = WorkAround()
    @State var firstName : String = ""
    @State var lastName : String  = ""
    var body: some View {
        VStack(alignment: .center){
            TextField("first name", text: $firstName)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(.blue)
                .padding(10)
            TextField("last name", text: $lastName)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(.blue)
                .padding(10)
            Button("Post"){
                let postRequest : Users = Users(id: 0, firstName: firstName, lastName: lastName)
                postData(user: postRequest, url: "\(workAround.myUrl)add", workAround: workAround)
            }
            .padding(12)
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.teal)
            .scaledToFit()
            .clipShape(Capsule())
        }
        .scaledToFill()
        .padding()
    }
}
