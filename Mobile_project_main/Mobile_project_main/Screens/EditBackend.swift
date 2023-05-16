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
                NavigationLink("udate user"){
                    UpdateView(workAround: workAround)
                }
                NavigationLink("delete user"){
                    DeleteView(workAround: workAround)
                }
                NavigationLink("create user"){
                    PostView(workAround: workAround)
                }
            }
        }
    }
}
