//
//  UpdateByIdButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI
/**
 A SwiftUI button view responsible for changing the view of ContentView's subviews

 When the button is pressed:
 - workAround.notFound is  set to true to indicate that the request is not ready and the data hasn't been fetched yet
 - The buttonNumber property of the workAround object is set to 3 to indicate that the subview in ContentView should
 be changed accordingly
 
 variables:
 - workAround : WorkAround, the same globally used structure
 */
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
