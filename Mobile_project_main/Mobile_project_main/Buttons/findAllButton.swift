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
            Button("Search all"){
                workAround.notFound = true
                fetchData(workAround : workAround, url : myURL)
                workAround.buttonNumber = 1
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}
