//
//  EditTeacherView.swift
//  ProjectCRUD
//
//  Created by user226765 on 9/23/22.
//

import SwiftUI

struct EditTeacherView: View {
    
    
    @State var name: String;
    @State var email: String;
    @State var idTeacher: Int;
    @EnvironmentObject var TeacherControllerEdit: TeacherController;
    @Environment(\.dismiss) var dismiss;
    
    var body: some View {
        Form {
            Section {
                VStack {
                    Text("\(Image(systemName: "list.bullet.clipboard")) Name")
                    TextField("Input name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                    Text("\(Image(systemName: "envelope.fill")) Email")
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                        .foregroundColor(.black)
                }
                HStack{
                    Button("Update") {
                        print("\(name)")
                        TeacherControllerEdit.updateTeacher(id: idTeacher, name: name, email: email)
                        TeacherControllerEdit.findAll()
                        dismiss()
                    }
                }
            }
        }
    }

}
