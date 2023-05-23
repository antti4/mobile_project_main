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
    
    var body: some View {
        Button{
            workAround.buttonNumber = 3
        } label: {
            Label("Modify", systemImage: "pencil.and.outline")
                .foregroundColor(.secondary)
                .imageScale(.large)
        }
        .frame(maxWidth: .infinity)
        .padding([.trailing], 30)
    }
}
