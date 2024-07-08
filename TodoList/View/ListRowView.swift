//
//  ListRowView.swift
//  TodoList
//
//  Created by Adarsh Chaurasia on 25/04/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?
                  "checkmark.circle" : "circle")
            .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical,9)
    }
}

var item1 = ItemModel(Title: "Item 1", IsCompleted: true)
#Preview {
    ListRowView(item: item1)
}
