//
//  CreateUser.swift
//  WhatILearned
//
//  Created by Ghadirian, Hamed, HSE DE on 08.12.23.
//
import SwiftUI

struct CreateUser: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var companyName: String = ""
    @State private var designation: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("First Name", text: $firstName)
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $lastName)
                .textFieldStyle(.roundedBorder)
            TextField("Company Name", text: $companyName)
                .textFieldStyle(.roundedBorder)
            TextField("Designation", text: $designation)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .padding(20)
        .navigationTitle("Create User")
        .toolbar {
            Button(action: {
                let user = SwiftDataUser(
                    firstName: firstName,
                    lastName: lastName,
                    company: SwiftDataCompany(companyName: companyName, designation: designation)
                )
                modelContext.insert(user)
                do {
                    try modelContext.save()
                    presentationMode.wrappedValue.dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
                Text("Save")
            })
        }
    }
}
