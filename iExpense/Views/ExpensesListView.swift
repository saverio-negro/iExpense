//
//  ExpensesListView.swift
//  iExpense
//
//  Created by Saverio Negro on 01/12/24.
//

import SwiftUI

struct ExpensesListView: View {
    
    var expenses: Expenses
    let type: String
    
    func getExpenseColor(amount: Double) -> Color {
        switch amount {
        case 0...10:
            return Color.indigo
        case 10...100:
            return Color(red: 0.83, green: 0.33, blue: 0.00)
        default:
            return Color(red: 0.75, green: 0.22, blue: 0.17)
        }
    }
    
    var body: some View {
        
        Text("\(type) Expenses")
            .foregroundStyle(Material.thin)
            .font(.title2)
            .bold()
        
        List {
            ForEach(expenses.items) { item in
                if item.type == self.type {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(getExpenseColor(amount: item.amount))
                    }
                    .foregroundStyle(.indigo)
                    .listRowBackground(Material.thin)
                }
            }
            .onDelete(perform: expenses.removeItems)
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ExpensesListView(expenses: Expenses(), type: "Personal")
}
