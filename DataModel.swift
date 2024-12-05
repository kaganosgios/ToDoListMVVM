//
//  DataModel.swift
//  UiPractice
//
//  Created by KağanKAPLAN on 4.12.2024.
//

import Foundation

struct DataModel: Identifiable, Hashable{
    var id = UUID()
    var name: String
    var date: Date
    var isChecked: Bool
}
