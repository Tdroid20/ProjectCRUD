//
//  ContentView.swift
//  ProjectCRUD
//
//  Created by user226765 on 9/21/22.
//

import SwiftUI;

struct ContentView: View {
    
    @EnvironmentObject var TeacherC: TeacherController;
    @State var isAddView = false;
    @State var isEditView = false;
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("IEmployees")
                    List {
                        ForEach(TeacherC.resutsData, id: \.id) { item in
                            NavigationLink(destination: EditTeacherView(name: item.nome, email: item.email, idTeacher: item.id)) {
                                Text("\(item.nome)")
                            }
                        }.onDelete(perform: deleteTeacherFunc)
                    }
                    
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button(action: {
                            isAddView = true;
                        }, label: {
                            Label("Add Teacher", systemImage: "plus.circle")
                        })
                    })
                
                    
                }.sheet(isPresented: $isAddView) {
                    AddTeacherView()
                }
                
            }
        }
        .padding()
    }
    
    func deleteTeacherFunc(offset: IndexSet) {
        let id = offset.map({
            TeacherC.resutsData[$0].id;
        });
        
        for i in id {
            TeacherC.deleteTeacher(id: i)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
