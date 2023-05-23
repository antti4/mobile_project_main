//
//  EditBackend.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI
/**
 A SwiftUI view for editing backend data.

 The EditBackend view displays a list of navigation links that allow users to send requests to modify backend data.

 Within the body of the view:
 - A NavigationStack contains a list of three NavigationLink views
 -  the views are for updating, deleting, and creating a user.
 - Each NavigationLink is wrapped in a Color view that colors the background of the navigationlinks into a .SecondarySystemBackground
 - Each navigation takes you to a different view for different modifying actions (UpdateView, DeleteView, and PostView)
 */
struct EditBackend: View {
    @ObservedObject var workAround = WorkAround()
    var body: some View {
        NavigationStack{
            List{
                NavigationLink("update user"){
                    Color(UIColor.secondarySystemBackground)
                        .ignoresSafeArea()
                        .overlay(UpdateView(workAround: workAround))
                }
                NavigationLink("delete user"){
                    Color(UIColor.secondarySystemBackground)
                        .ignoresSafeArea()
                        .overlay(DeleteView(workAround: workAround))
                }
                NavigationLink("create user"){
                    Color(UIColor.secondarySystemBackground)
                        .ignoresSafeArea()
                        .overlay(PostView(workAround: workAround))
                }
            }
        }
    }
}
