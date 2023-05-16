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
    @State var bind : String = ""
    var body: some View {
            List{
                if(!workAround.notFound){
                    ForEach(workAround.users!, id: \.firstName) { user in
                        Text("\(user.id) | \(user.firstName) \(user.lastName) ")
                            .padding()
                            .cornerRadius(20)
                    }
                }
            }
            .searchable(text: $bind)
            .onSubmit(of: .search) {
              fetchDataById(workAround: workAround, url:"\(workAround.myUrl)search?q=\(bind)")
            }
            Spacer()
    }
}
