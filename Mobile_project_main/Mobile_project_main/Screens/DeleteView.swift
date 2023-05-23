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
