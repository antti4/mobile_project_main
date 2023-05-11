//
//  PostButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI

struct PostButton: View {
    @ObservedObject var workAround = WorkAround()
    @State var id : String = ""
    @State var firstName : String = ""
    @State var lastName : String  = ""
    var body: some View {
        HStack{
            TextField("id", text: $id)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            TextField("first name", text: $firstName)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            TextField("last name", text: $lastName)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
        }
        .padding()
        Button("Post"){
            let postRequest : Users = Users(id: Int(id) ?? 0, firstName: firstName, lastName: lastName)
            postData(user: postRequest, url: "https://dummyjson.com/users/")
        }
    }
}
