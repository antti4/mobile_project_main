//
//  backButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI

struct BackButton: View {
    @ObservedObject var workAround = WorkAround()
    var body: some View {
        Button("back"){
            workAround.buttonNumber = 0
            workAround.notFound = true
        }
        .padding()
    }
}
