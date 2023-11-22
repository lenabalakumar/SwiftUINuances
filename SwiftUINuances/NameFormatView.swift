//
//  NameFormatView.swift
//  SwiftUINuances
//
//  Created by Lenabalakumar Subbarayan on 22/11/2023.
//

import SwiftUI

struct NameFormatView: View {
    let name = PersonNameComponents(namePrefix: "Dr.",
                                    givenName: "Thomas",
                                    middleName: "Louis",
                                    familyName: "Clark",
                                    nameSuffix: "Jr.",
                                    nickname: "Tom")
    
    let fullName = "Katie Ginger"
    
    var initials: String {
        let nameFormatter = PersonNameComponentsFormatter()
        nameFormatter.style = .abbreviated
        let fullNameComponent = nameFormatter.personNameComponents(from: fullName)
        return nameFormatter.string(from: fullNameComponent!)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text(name, format: .name(style: .long))
                    Text(name, format: .name(style: .medium))
                    Text(name, format: .name(style: .short))
                    Text(name, format: .name(style: .abbreviated))
                } header: {
                    Text("Name formats")
                } footer: {
                    Divider()
                }
                
                Section {
                    Text(initials)
                } header: {
                    Text("Derived initials")
                }
            }
            .navigationTitle("Name formats in SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NameFormatView_Previews: PreviewProvider {
    static var previews: some View {
        NameFormatView()
    }
}
