//
//  Expenses.swift
//  iExpense
//
//  Created by Saverio Negro on 30/11/24.
//

import SwiftUI

@Observable
class Expenses {
    var items = [ExpenseItem]()
    
    func removeItems(at offsets: IndexSet) {
        self.items.remove(atOffsets: offsets)
    }
}
