//
//  DeleteView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI

struct DeleteView: View {
    @ObservedObject var workAround = WorkAround()
    @State var bind : String = ""
    @State var showToast : Bool = false
    var body: some View {
        VStack{
            TextField(
                    "place id",
                    text: $bind
                )
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
            Button("Delete"){
                deleteData(workAround: workAround, url: "\(workAround.myUrl)\(Int(bind) ?? 0)")
            }
        }
        .padding()
    }
}
