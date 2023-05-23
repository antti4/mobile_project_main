//
//  FindAllView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI
/**
 A SwiftUI view for displaying a list of users.

 The FindAllView view is responsible for displaying a list of the first 30 users fetched from the backend.

 Within the body of the view:
 - An if-else statement is used to navigate two views: when workAround.notFound is true workAround.notFound is false
 - If the users are not found(true), a Text view with the message "please wait" is displayed in gray color.
 - If the users are found(false), a List view  is displayed with the first 30 users from backend.
 - the users are displayed in the list by going over workAround.users with a for-each loop
 - Each user is displayed as a Text view showing the user's ID, first name, and last name.
 */
struct FindAllView: View {
    @ObservedObject var workAround = WorkAround()
    var body: some View {
        if(workAround.notFound){
            Text("please wait")
                .foregroundColor(.gray)
        }else{
            List{
                ForEach(workAround.users!, id: \.firstName) { user in
                    Text("\(user.id) | \(user.firstName) \(user.lastName) ")
                        .padding()
                        .cornerRadius(20)
                }
            }
        }
    }
}
