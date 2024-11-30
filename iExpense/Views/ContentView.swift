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
            ZStack {
                BackgroundView()
            }
            .ignoresSafeArea()
            .navigationTitle("iExpense")
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
