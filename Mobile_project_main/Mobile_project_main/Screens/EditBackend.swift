//
//  EditBackend.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI

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
