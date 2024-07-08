//
//  ListView.swift
//  TodoList
//
//  Created by Adarsh Chaurasia on 25/04/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    var body: some View {
        ZStack{
            if listviewmodel.items.isEmpty{
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else {
                List{
                    ForEach(listviewmodel.items){ item in
                      ListRowView(item: item)
                            .onTapGesture {
                                withAnimation (.linear){
                                    listviewmodel.update(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listviewmodel.deleteItem)
                    .onMove(perform: listviewmodel.moveItem)
                }
            }
        }.navigationTitle("Todo List 📝")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add",destination: AddView()))
    }
}

#Preview {
        ListView()
   
}
