import Foundation

class DViewModel: ObservableObject {
    @Published var toDoItems: [DataModel] = []
    
    func addToDoItem(name: String, date: Date) {
            let newItem = DataModel(id: UUID(), name: name, date: date, isChecked: false)
            toDoItems.append(newItem)
        }

    func removeToDoItem(item: DataModel) { if let index = toDoItems.firstIndex(where: { $0.id == item.id }) { toDoItems.remove(at: index) } }
        
        func toggleCheck(_ item: DataModel) {
            if let index = toDoItems.firstIndex(where: { $0.id == item.id }) {
                toDoItems[index].isChecked.toggle()
            }
        }
    init() {
        toDoItems = [
            DataModel(id: UUID(), name: "Buy groceries", date: Date(), isChecked: false),
            DataModel(id: UUID(), name: "Finish homework", date: Date().addingTimeInterval(3600), isChecked: false)
        ]
    }
}
