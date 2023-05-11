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
            if (workAround.notFound) {
                Spacer()
                Button("Search all"){
                    fetchData(workAround : workAround, url : myURL)
                    workAround.buttonNumber = 1
                }
            }else if(workAround.buttonNumber == 1){
                List{
                    ForEach(workAround.users!, id: \.firstName) { user in
                        Text("\(user.id) | \(user.firstName) \(user.lastName) ")
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
