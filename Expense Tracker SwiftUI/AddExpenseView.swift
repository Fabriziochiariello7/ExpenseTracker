//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Fabrizio Chiariello on 28/03/23.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State var selection = ["Income", "Expense"]
    @State var expenseSelection = "Expense"
    @State var selectedTitle = ""
    @State var selectedDescription = ""
    @State var selectedDate : Date
    
    var body: some View {
        
        
        VStack {
            Spacer()
            Text("**Enter your expense!**")
                .font(.title)
            Spacer()
            Picker("Expense", selection: $expenseSelection){
                ForEach(selection, id: \.self) { selection in
                    Text("\(selection)")
                }
            }
            TextField("Enter Title...", text: $selectedTitle)
                .padding()
            TextField("Enter Description...", text: $selectedDescription)
                .frame( height: 40)
                .padding()
            DatePicker("Select date..", selection: $selectedDate)
                .padding()
            Spacer()
            Button("Save"){
                print("Button pressed")
            }.foregroundColor(.white)
            .background(
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 50)
                .foregroundColor(.blue)
            )
            Spacer()
        }
        
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenseSelection: "Expense", selectedDate: Date() )
    }
}
