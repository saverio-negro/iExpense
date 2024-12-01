//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Saverio Negro on 30/11/24.
//

import SwiftUI

// Struct representing the single expense item
struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
