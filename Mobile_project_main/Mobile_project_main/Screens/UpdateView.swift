//
//  UpdateView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI
/**
 A SwiftUI view for updating a specific user.

 UdateView  displays text fields for entering an id, a first name and a last name, and a button for updating the user.

 Within the body of the view:
 - A VStack is used to arrange the three TextFields and a Button vertically.
 - The three TextField views are displayed for enteringthe id, first name and last name respectively. The variables bindId bindFName and bindLName are bound to the text fields with the @State annotation to capture the entered values.
 - A Button is labeled "update" and when tapped, it creates Users object using the entered id, first name and last name, and calls the updateData
 function to send the user data to the specified URL.
 - The button and TextFields include additional styling options for easier user experience.
 */
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
