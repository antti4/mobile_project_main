//
//  FindAllView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI

struct FindAllView: View {
    @ObservedObject var workAround = WorkAround()
    var body: some View {
        if(workAround.notFound){
            Text("please wait")
        }else{
            List{
                ForEach(workAround.users!, id: \.firstName) { user in
                    Text("\(user.id) | \(user.firstName) \(user.lastName) ")
                        .padding()
                        .cornerRadius(20)
                }
            }
            BackButton(workAround: workAround)
        }
    }
}
