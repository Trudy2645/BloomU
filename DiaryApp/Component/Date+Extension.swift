//
//  Date+Extetion.swift
//  DiaryApp
//
//  Created by 트루디 on 4/17/24.
//

import SwiftUI


extension Date {
    func format(_ formatText: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatText
        formatter.locale = Locale(identifier: "ko-KR")
        
    
        return formatter.string(from: self)
    }
}
