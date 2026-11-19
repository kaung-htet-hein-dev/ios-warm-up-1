import SwiftUI

struct TodoDetailView: View {
    @Binding var item: TodoItem

    var body: some View {
        Form {
            Section("Title") {
                TextField("Title", text: $item.title)
            }
            Section("Notes") {
                TextEditor(text: $item.notes)
                    .frame(minHeight: 120)
            }
            Section {
                Toggle("Completed", isOn: $item.isDone)
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TodoDetailView(item: .constant(TodoItem(title: "Preview", notes: "Some notes")))
    }
}
