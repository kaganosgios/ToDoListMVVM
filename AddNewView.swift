//
//  AddNewView.swift
//  UiPractice
//
//  Created by KağanKAPLAN on 4.12.2024.
//

import SwiftUI

struct AddNewView: View {
    @ObservedObject var viewModel: DViewModel
    @State private var newToDoName : String = ""
    @State private var newDate : Date = Date()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            VStack{
                HStack{
                    TextField(text: $newToDoName) {
                        Text("NewToDo")
                        
                    }
                    .textFieldStyle(.roundedBorder).cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(height: 80)
                }
                DatePicker("Pick the Date", selection: $newDate, displayedComponents: .date)
                    .bold()
                    .padding()
                    
                
                Button(action: {
                    let newItem = viewModel.addToDoItem(name: newToDoName, date: newDate)
                    //viewModel.addToDoItem(name: newItem)
                    presentationMode.wrappedValue.dismiss()

                          }) {
                              Text("Add ToDo")
                                  .padding()
                                  .background(Color.green)
                                  .foregroundColor(.white)
                                  .cornerRadius(10)
                          }
                          .padding()
                      
                
                    .padding()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all)
        .background(Color(hue: 0.76, saturation: 0.354, brightness: 0.661))
    }
}

#Preview {
    AddNewView(viewModel: DViewModel())
    
}
