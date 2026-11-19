import SwiftUI

struct ContentView: View {
    @State private var store = TodoStore()
    @State private var newTitle = ""

    var body: some View {
        NavigationStack {
            List($store.items) { $item in
                NavigationLink {
                    TodoDetailView(item: $item)
                } label: {
                    TodoRow(item: $item)
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        withAnimation { store.delete(item) }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("\(store.remainingCount) left")
                        .foregroundStyle(.secondary)
                }
            }
            .overlay {
                if store.items.isEmpty {
                    ContentUnavailableView(
                        "No todos",
                        systemImage: "checklist",
                        description: Text("Add one below.")
                    )
                }
            }
            .safeAreaInset(edge: .bottom) {
                addBar
            }
        }
    }

    private var addBar: some View {
        HStack(spacing: 12) {
            TextField("New todo", text: $newTitle)
                .textFieldStyle(.roundedBorder)
                .onSubmit(addItem)
            Button("Add", action: addItem)
                .buttonStyle(.borderedProminent)
                .disabled(newTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding()
        .background(.bar)
    }

    private func addItem() {
        withAnimation { store.add(title: newTitle) }
        newTitle = ""
    }
}

#Preview {
    ContentView()
}
