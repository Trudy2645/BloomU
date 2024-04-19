//
//  DiaryAppApp.swift
//  DiaryApp
//
//  Created by 트루디 on 4/9/24.
//

import SwiftUI
import SwiftData

@main
struct DiaryApp: App {
    var body: some Scene {
        WindowGroup {
            MonthHomeView()
//            WritingDiaryView()
        }.modelContainer(for: dailyDiary.self)
    }
}
