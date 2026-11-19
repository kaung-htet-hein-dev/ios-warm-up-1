//
//  TodoStore.swift
//  Todo
//
//  Created by administrator on 18/11/2026.
//

import Foundation

@Observable
final class TodoStore {
    var items = TodoItem.samples
    
    var remainingCount: Int {
        let remaining = items.filter { i in
            !i.isDone
        }
        
        return remaining.count
    }
    
    func add(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        items.insert(TodoItem(title: trimmed), at: 0)
    }
    
    func delete(_ item: TodoItem) {
        items.removeAll { i in
            i.id == item.id
        }
    }
}
