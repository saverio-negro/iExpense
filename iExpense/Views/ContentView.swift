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
                    List {
                        ForEach(expenses.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: "USD"))
                            }
                            .foregroundStyle(.indigo)
                            .listRowBackground(Material.thin)
                        }
                        .onDelete(perform: expenses.removeItems)
                    }
                    .scrollContentBackground(.hidden)
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
                .presentationBackground(Color.cyan.gradient)
        }
    }
}

#Preview {
    ContentView()
}
