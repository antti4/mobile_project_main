//
//  findAllButton.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 11.5.2023.
//

import Foundation
import SwiftUI
/**
 A SwiftUI button view responsible for fetching all items from the provided url.

 The FindAllButton struct  represents a button view that triggers the fetching of all items when tapped.

 When the button is pressed:
 - workAround.notFound is  set to true to indicate that the request is not ready and the data hasn't been fetched yet
 - the button calls fetchData function that is responsiple for the api call
 - The buttonNumber property of the workAround object is set to 1 to indicate that the subview in ContentView should
 be changed accordingly
 variables:
 - myUrl : String , the base url that in this context doesn't have to be added on
 - workAround : WorkAround, the same globally used structure
 */
struct FindAllButton: View {
    @ObservedObject var workAround = WorkAround()
    let myURL : String
    var body: some View {
        
            Button{
                workAround.notFound = true
                fetchData(workAround : workAround, url : myURL)
                workAround.buttonNumber = 1
            } label: {
                Label("All", systemImage: "note.text")
                    .foregroundColor(.secondary)
                    .imageScale(.large)
            }
            .frame(maxWidth: .infinity)
        
    }
}
