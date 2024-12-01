//
//  Expenses.swift
//  iExpense
//
//  Created by Saverio Negro on 30/11/24.
//

import SwiftUI

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encodedItems = try? encoder.encode(items) {
                UserDefaults.standard.set(encodedItems, forKey: "Items")
            }
        }
    }
    
    init(items: [ExpenseItem] = [ExpenseItem]()) {
        
        if let itemsJSON = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decodedItems = try? decoder.decode(Array<ExpenseItem>.self, from: itemsJSON) {
                self.items = decodedItems
            }
        }
    }
    
    
    func removeItems(at offsets: IndexSet) {
        self.items.remove(atOffsets: offsets)
    }
}
