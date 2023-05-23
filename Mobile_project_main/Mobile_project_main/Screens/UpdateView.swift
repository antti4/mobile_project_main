//
//  UpdateView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI

struct UpdateView: View {
    @ObservedObject var workAround = WorkAround()
    @State var bindId : String = ""
    @State var bindFName : String = ""
    @State var bindLNanme : String = ""
    
    var body: some View {
        VStack{
            TextField("place id", text: $bindId)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(.blue)
                .padding(10)
            TextField("write first name", text: $bindFName)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(.blue)
                .padding(10)
            TextField("write last name", text: $bindLNanme)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(.blue)
                .padding(10)
            
            Button("update"){
                let user : Users = Users(id: Int(bindId) ?? 0, firstName: bindFName, lastName: bindLNanme)
                updateData(workAround: workAround, url: "\(workAround.myUrl)\(bindId)", user: user)
            }
            .padding(12)
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.teal)
            .scaledToFit()
            .clipShape(Capsule())
        }
        .padding()
    }
}
