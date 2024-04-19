//
//  CalendarView.swift
//  DiaryApp
//
//  Created by 트루디 on 4/9/24.
//

import SwiftUI

struct CalendarView: View {
    // @State 속성 래퍼로 현재 날짜 추적
    @Binding var date: Date
    
    var body: some View {
        DatePicker(
            "Start Date", //DatePicker의 레이블 텍스트
            selection: $date, // 사용자가 선택한 날짜를 저장할 바인딩
            displayedComponents: [.date] // DataPicker에 표시할 구성 요소 설정
        )
        // datePickerStyle(.graphical)을 사용하여 그래픽 스타일의 DatePicker를 적용
        .datePickerStyle(.graphical)
        //.datePickerStyle(.compact)로 하면 날짜를 눌러야 캘린더가 나온다!
        .environment(\.locale, .init(identifier: "ko_KR")) // 한국어 설정
    }
}

//#Preview {
//    CalendarView()
//}
