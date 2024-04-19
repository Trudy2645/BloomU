//
//  SelectDate.swift
//  DiaryApp
//
//  Created by 트루디 on 4/13/24.//

import SwiftUI

struct SelectDate: View {
    @Environment(\.dismiss) var dismiss
    // 선택된 날짜를 저장하는 상태 변수
    @State private var selectedDate = Date()
    
    
    var body: some View {
        NavigationStack{
            HStack{
                //뒤로가기 버튼
                Button(action: {
                    print("뒤로가기 버튼 눌림")
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 13, height: 22)
                })
                .padding(.leading)
                
                Spacer()
                
                //날짜 선택
                DatePicker("", selection: $selectedDate, 
                           displayedComponents: .date)
                    .datePickerStyle(.compact)  // DatePicker 스타일 설정
                    .environment(\.locale, .init(identifier: "ko_KR"))
                    .frame(maxWidth: 50)
                
                Spacer()
                //                    .padding()  // 패딩 추가
                BtnBookMark()
                    .padding(.trailing)
            }
        }
    }
    
    // 날짜를 원하는 형식으로 출력하기 위한 DateFormatter
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}

#Preview {
    SelectDate()
}
