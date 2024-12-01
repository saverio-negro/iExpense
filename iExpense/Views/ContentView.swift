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
                            Text(item.name)
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
                    showingAddExpense.toggle()
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
}

#Preview {
    ContentView()
}
