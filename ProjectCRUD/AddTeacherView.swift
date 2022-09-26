//
//  AddTeacherView.swift
//  ProjectCRUD
//
//  Created by user226765 on 9/21/22.
//

import SwiftUI

struct AddTeacherView: View {
    
    @Environment(\.dismiss) var dismiss;
    @State var name: String = "";
    @State var email: String = "";
    @EnvironmentObject var TeacherControllerAdd: TeacherController;
    
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
                    Button("Submit") {
                        TeacherControllerAdd.createTeacher(name: name, email: email)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddTeacherView_Previews: PreviewProvider {
    static var previews: some View {
        AddTeacherView()
    }
}
