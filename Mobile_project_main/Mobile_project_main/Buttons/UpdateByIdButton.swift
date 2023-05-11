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
    @State var bind : String = ""
    var body: some View {
        VStack{
            TextField(
                "place id",
                text: $bind
            )
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            Button("update"){
                        
            }
        }
        .padding()
    }
}
