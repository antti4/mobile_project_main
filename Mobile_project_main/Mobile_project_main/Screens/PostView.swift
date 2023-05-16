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
        HStack{
            TextField("first name", text: $firstName)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            TextField("last name", text: $lastName)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
        }
        .padding()
        Button("Post"){
            let postRequest : Users = Users(id: 0, firstName: firstName, lastName: lastName)
            postData(user: postRequest, url: "\(workAround.myUrl)add")
        }
    }
}
