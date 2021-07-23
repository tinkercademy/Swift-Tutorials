import SwiftUI

struct ContentView: View {
    
    @State var todos = [Todo(title: "Feed the cat", isCompleted: true),
                        Todo(title: "Play with cat"),
                        Todo(title: "Get allergies"),
                        Todo(title: "Run away from cat"),
                        Todo(title: "Get a new cat")]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    Button {
                        let todoIndex = todos.firstIndex(of: todo)!
                        todos[todoIndex].isCompleted.toggle()
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                                .foregroundColor(.black)
                        }
                    }
                }
                .onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
