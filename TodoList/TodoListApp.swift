//
//  TodoListApp.swift
//  TodoList
//
//  Created by Adarsh Chaurasia on 17/04/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @State var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
