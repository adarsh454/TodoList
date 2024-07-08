//
//  AddView.swift
//  TodoList
//
//  Created by Adarsh Chaurasia on 19/04/24.
//

import SwiftUI

struct AddView: View {
    
    //dismiss a view
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    @State var textFieldText : String = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
     
        ScrollView{
            VStack{
                TextField("Add something here ✏️", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.961))
                    .cornerRadius(10)
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                })
            }.padding(16)
        }.navigationTitle("Add an Item ")
            .alert(isPresented: $showAlert, content: getAlert)
    }
     
    func saveButtonTapped (){
        if textIsValid(){
            listviewmodel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
                }
                       
                       
                       
    func textIsValid() -> Bool{
        if textFieldText.count<3{
            alertTitle = "your todo item should contain at least 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
        func getAlert() -> Alert{
            return Alert(title: Text(alertTitle))
        }
    }


#Preview {
    AddView()
}
