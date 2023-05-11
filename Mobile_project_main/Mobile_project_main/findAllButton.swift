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
    let myURL = "https://dummyjson.com/users"
    var buttonPressed = false
    var body: some View {
        VStack {
            if (workAround.users == nil) {
                Button("Search"){
                    fetchData(workAround : workAround, url : myURL)
                    workAround.buttonNumber = 1
                }
            }else if(workAround.buttonNumber == 1){
                List{
                    ForEach(workAround.users!, id: \.firstName) { user in
                        Text("\(user.firstName) \(user.lastName)")
                            .padding()
                            .cornerRadius(20)
                    }
                }
                BackButton(workAround: workAround)
            }
        }
        .padding()
    }
}
