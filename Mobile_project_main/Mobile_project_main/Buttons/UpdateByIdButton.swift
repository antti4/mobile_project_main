//
//  UpdateByIdButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI

struct UpdateButton: View {
    @ObservedObject var workAround = WorkAround()
    let myURL : String
    @State var bindId : String = ""
    @State var bindFName : String = ""
    @State var bindLNanme : String = ""
    
    var body: some View {
        VStack{
            TextField(
                "place id",
                text: $bindId
            )
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            TextField(
                "write first name",
                text: $bindFName
            )
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            TextField(
                "write last name",
                text: $bindLNanme
            )
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            Button("update"){
                let user : Users = Users(id: Int(bindId) ?? 0, firstName: bindFName, lastName: bindLNanme)
                updateData(workAround: workAround, url: "\(myURL)\(bindId)", user: user)
            }
        }
        .padding()
    }
}
