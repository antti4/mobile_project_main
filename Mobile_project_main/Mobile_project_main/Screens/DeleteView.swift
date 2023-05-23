//
//  DeleteView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI
/**
 A SwiftUI view for deleting a user.

 The DeleteView displays a text field for entering an ID and a button for deleting a user.

 Within the body of the view:
 - The TextField and Button are stacked vertically within a VStack
 - A TextField is displayed for entering a ID. The @State variable bind is bound to the field with
 - the Button is labeled "Delete" and when tapped, it invokes the deleteData function to delete the user with the specified ID from the backend.
 - The button and TextField include additional styling options for easier user experience.
 */
struct DeleteView: View {
    @ObservedObject var workAround = WorkAround()
    @State var bind : String = ""
    @State var showToast : Bool = false
    var body: some View {
        VStack{
            TextField("place id", text: $bind)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(.blue)
                .padding(10)
            Button("Delete"){
                deleteData(workAround: workAround, url: "\(workAround.myUrl)\(Int(bind) ?? 0)")
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
