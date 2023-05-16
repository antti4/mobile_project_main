//
//  FindByIdButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI

struct FindByIdButton: View {
    @ObservedObject var workAround : WorkAround
    let myURL : String
    @State private var bind : Int = 1
    var body: some View {
        Button("find user"){
            workAround.notFound = true
            workAround.buttonNumber = 2
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}
