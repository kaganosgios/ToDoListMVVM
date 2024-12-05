//
//  ContentView.swift
//  UiPractice
//
//  Created by KağanKAPLAN on 4.12.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: DViewModel
    @State private var newToDoName : String=""
    @State private var newToDoDate : Date = Date()
    @State private var isChecked = false
    var body: some View {
        
        
        NavigationView{
            
                
                
            VStack{
                
                
                
                
                List {
                    ForEach(viewModel.toDoItems.indices, id: \.self) { index in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(viewModel.toDoItems[index].name)
                                    .font(.headline)
                                    .bold()
                                Text("\(viewModel.toDoItems[index].date, formatter: dateFormatter)")
                            }
                            Spacer()
                            
                            Image(systemName: viewModel.toDoItems[index].isChecked ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(viewModel.toDoItems[index].isChecked ? .green : .gray)
                                .onTapGesture {
                                    viewModel.toggleCheck(viewModel.toDoItems[index])
                                }
                            
                            if viewModel.toDoItems[index].isChecked {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .onTapGesture {
                                        viewModel.removeToDoItem(item: viewModel.toDoItems[index])
                                    }
                            }
                        }
                    }
                }
                NavigationLink(destination: AddNewView(viewModel: viewModel)) {
                    Text("Add New ToDo")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            
            
            
        
                
                
            }
        .navigationTitle("ToDoS")
        
           
        }
        
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()


#Preview {
    ContentView(viewModel: DViewModel())
}
