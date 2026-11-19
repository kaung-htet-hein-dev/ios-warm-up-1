//
//  TodoItem.swift
//  Todo
//
//  Created by administrator on 18/11/2026.
//

import Foundation

struct TodoItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var notes: String = ""
    var isDone: Bool = false
}

extension TodoItem {
    static let samples: [TodoItem] = (1...3).map { i in
        TodoItem(title: "Item \(i)", isDone: i%2 != 0)
    }
}
