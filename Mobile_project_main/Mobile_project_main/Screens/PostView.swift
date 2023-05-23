//
//  PostView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI

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
