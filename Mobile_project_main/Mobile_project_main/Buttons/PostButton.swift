//
//  PostButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI

struct PostButton: View {
    @ObservedObject var workAround = WorkAround()
    var body: some View {
        Button("Add user"){
            workAround.buttonNumber = 5
        }
    }
}
