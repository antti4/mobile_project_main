//
//  findAllButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI

struct FindAllButton: View {
    @ObservedObject var workAround = WorkAround()
    let myURL : String
    var body: some View {
        VStack {
            Button{
                workAround.notFound = true
                fetchData(workAround : workAround, url : myURL)
                workAround.buttonNumber = 1
            } label: {
                Label("All", systemImage: "note.text")
                    .foregroundColor(.gray)
                    .imageScale(.large)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
