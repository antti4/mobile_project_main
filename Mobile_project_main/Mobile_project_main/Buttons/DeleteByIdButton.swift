//
//  DeleteByIdButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI

struct DeleteButton: View {
    @ObservedObject var workAround = WorkAround()
    let myURL : String
    @State var bind : String = ""
    var body: some View {
        VStack{
            TextField(
                    "place id",
                    text: $bind
                )
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            Button("Delete"){
                deleteData(workAround: workAround, url: "\(myURL)\(Int(bind) ?? 0)")
            }
        }
        .padding()
    }
}
