//
//  AddView.swift
//  iExpense
//
//  Created by Saverio Negro on 01/12/24.
//

import SwiftUI

struct AddView: View {
    
    var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }
            
            TextField("Amount", value: $amount, format: .currency(code: "USD"))
                .keyboardType(.decimalPad)
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
