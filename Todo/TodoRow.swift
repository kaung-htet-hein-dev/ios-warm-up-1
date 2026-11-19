//
//  TodoRow.swift
//  Todo
//
//  Created by administrator on 18/11/2026.
//

import Foundation
import SwiftUI

struct TodoRow: View {
    @Binding var item: TodoItem
    
    var body: some View {
        HStack {
            Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                .font(.title2)
                .foregroundStyle(item.isDone ? Color.green : Color.secondary)
            
            Text(item.title)
                .strikethrough(item.isDone)
                .foregroundStyle(item.isDone ? Color.secondary : Color.primary)
        }.onTapGesture {
            item.isDone.toggle()
        }
    }
}

#Preview {
    TodoRow(item: .constant(TodoItem(title: "Preview row")))
        .padding()
}
