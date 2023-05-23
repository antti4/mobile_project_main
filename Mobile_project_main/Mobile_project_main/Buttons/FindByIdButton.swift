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
        Button{
            workAround.notFound = true
            workAround.buttonNumber = 2
        } label: {
            Label("Search", systemImage: "magnifyingglass")
                .foregroundColor(.secondary)
                .imageScale(.large)
        }
        .frame(maxWidth: .infinity)
        .padding([.trailing], 30)
    }
}
