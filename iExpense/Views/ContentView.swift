//
//  ContentView.swift
//  iExpense
//
//  Created by Saverio Negro on 26/11/24.
//

import SwiftUI

extension Material: @retroactive View {}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                    .ignoresSafeArea()
                VStack {
                    
                    // Personal Expenses List
                    ExpensesListView(expenses: expenses, type: "Personal")
                    
                    // Business Expenses List
                    ExpensesListView(expenses: expenses, type: "Business")
                    
                }
                .padding(.vertical, 20)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Item", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
                .presentationDetents([.medium])
                .presentationBackground(Material.regular)
        }
    }
}

#Preview {
    ContentView()
}
