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
        VStack {
            if (workAround.notFound) {
                TextField(
                        "place id",
                        value: $bind,
                        formatter: NumberFormatter()
                    )
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1))
                Spacer()
                    .frame(height: 30)
                Button("Search by id"){
                    fetchDataById(workAround : workAround, url : "\(myURL)\(bind)")
                    workAround.buttonNumber = 2
                }
                Spacer()
            }else if(workAround.buttonNumber == 2){
                Spacer()
                Text("\(workAround.user!.firstName) \(workAround.user!.lastName)")
                    .padding()
                    .cornerRadius(20)
                BackButton(workAround: workAround)
                Spacer()
            }
        }
        .padding()
    }
}
