//
//  Diary.swift
//  DiaryApp
//
//  Created by 트루디 on 4/16/24.
//

import SwiftUI
import SwiftData

@Model
class dailyDiary {
    var id: UUID
    var diaryDate: Date
    var diaryTitle: String
    var diaryContent: String
    var isBookmarked: Bool
    
    init(id: UUID = UUID(), diaryDate: Date, diaryTitle: String, diaryContent: String, isBookmarked: Bool = false) {
        self.id = id
        self.diaryDate = diaryDate
        self.diaryTitle = diaryTitle
        self.diaryContent = diaryContent
        self.isBookmarked = isBookmarked
    }
    
}
