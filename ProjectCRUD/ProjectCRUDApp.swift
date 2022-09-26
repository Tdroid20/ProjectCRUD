//
//  ProjectCRUDApp.swift
//  ProjectCRUD
//
//  Created by user226765 on 9/21/22.
//

import SwiftUI

@main
struct ProjectCRUDApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TeacherController())
        }
    }
}
