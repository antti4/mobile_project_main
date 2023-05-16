//
//  FindByIdView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI

struct FindByIdView: View {
    @ObservedObject var workAround = WorkAround()
    @State var bind : Int = 0
    var body: some View {
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
                fetchDataById(workAround : workAround, url : "\(workAround.myUrl)\(bind)")
            }
            Spacer()
        if(!workAround.notFound){
               Spacer()
               Text("\(workAround.user!.firstName) \(workAround.user!.lastName)")
                   .padding()
                   .cornerRadius(20)
               BackButton(workAround: workAround)
               Spacer()
        }
    }
}
