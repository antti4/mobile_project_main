//
//  FindByIdView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI

struct FindByIdView: View {
    @ObservedObject var workAround = WorkAround()
    @State var bind : String = ""
    var body: some View {
            TextField(
                    "write name",
                    text: $bind
                )
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            Spacer()
                .frame(height: 30)
            Button("Search by id"){
                fetchDataById(workAround : workAround, url : "\(workAround.myUrl)search?q=\(bind)")
            }
            Spacer()
        if(!workAround.notFound){
               Spacer()
            List{
                ForEach(workAround.users!, id: \.firstName) { user in
                    Text("\(user.id) | \(user.firstName) \(user.lastName) ")
                        .padding()
                        .cornerRadius(20)
                }
            }
            Spacer()
        }
    }
}
