//
//  FindByIdView.swift
//  Mobile_project_main
//
//  Created by Antti Hokkinen on 16.5.2023.
//

import Foundation
import SwiftUI
/**
 A SwiftUI view for searching and displaying a user through a query.

 The FindByIdView displays a list of users based on a search query. The Viev contais a @State property bind that is used for the query

 Within the body of the view:
 - the results are displayed as a list once found
 - An if statement is used to check if the users are found (!workAround.notFound).
 - the found users are diplayed displayed by a foreach loop
 - Each user is displayed as a Text view showing the user's ID, first name, and last name.
 - the query body is aquired with a searchable property that is bound to the bind variable
 - with the .onSubmit modifier the query will start once the search query is submitted
 */
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
