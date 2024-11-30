//
//  ContentView.swift
//  iExpense
//
//  Created by Saverio Negro on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
