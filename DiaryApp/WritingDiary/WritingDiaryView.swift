//
//  WriteField.swift
//  DiaryApp
//
//  Created by 트루디 on 4/13/24.
//

import SwiftUI
import SwiftData
import Combine

struct WritingDiaryView: View {
    @Environment(\.modelContext) var modelContext
    @State var newTitle = ""
    @State var newContext = ""
    @State var newDate = Date()
    @Environment(\.dismiss) private var dismiss
    @State var isClikedOkay = false
    @FocusState var isFocused: Bool
    
    
    let titleLimit = 10
    let contentLimit = 200
    
    
    var body: some View {
        let contentPlaceholder = "오늘의 하루에 물을 주세요...(0/\(contentLimit))"
        
        
        NavigationStack{
            VStack {
                //상단바
                HStack{
                    //뒤로가기 버튼
                    BackBtn()
                    
                    Spacer()
                    
                    //날짜 선택
                    DatePicker("", selection: $newDate,
                               displayedComponents: .date)
                    .datePickerStyle(.compact)  // DatePicker 스타일 설정
                    .environment(\.locale, .init(identifier: "ko_KR"))
                    .frame(maxWidth: 50)
                    .padding(.trailing, 126)
                    //확인 버튼
                    Button("완료") {
                        print("Tip: ㅇ")
                        addDiary()
                        hideKeyboard()
                        isClikedOkay = true
                        
                    }
                    .tint(Color.pMint)
                    .navigationDestination(isPresented: $isClikedOkay){
                        DiaryListView()
                    }
                    .padding(.trailing, 5)
                    
                }
                let placeholder = newTitle.isEmpty ? "제목을 입력하세요...(0/\(titleLimit))" : ""
                
                // 제목 입력
                ZStack{
                    HStack{
                        TextField(placeholder, text: $newTitle)
                            .frame(width: 150, height: 50)
                            .keyboardType(.default)
                            .disableAutocorrection(true)
                            .bold()
                            .onReceive(Just(newTitle)){ _ in limitTitle(titleLimit)
                            }
                            .foregroundColor(.gray) // 텍스트 색상 변경
                            .padding(.leading, 5)
                            .focused($isFocused)
                        
                        Spacer()
                        
                        Text("(\(newTitle.count)/\(titleLimit))")
                            .foregroundColor(newTitle.isEmpty ? .gray : .white) // 입력이 비어 있을 때 글자 수 표시를 회색으로 만듭니다.
                            .padding(.trailing, 5)
                    }
                }
                .onTapGesture {
                    isFocused = false
                }
                // 구분선
                Divider()
                    .frame(height: 1.5)
                    .background(Color.pMint)
                    .padding(.bottom, 10)
                    .frame(width: 360)
                
                // 내용
                ZStack(alignment: .topLeading){
                    TextEditor(text: $newContext)
                        .frame(height: 320)
                        .frame(maxHeight: 350)
                        .onReceive(Just(newContext)) { _ in limitContent(contentLimit) }
                        .keyboardType(.default)
                        .focused($isFocused)
                    
                    if newContext.isEmpty {
                        Text(contentPlaceholder)
                            .foregroundStyle(.tertiary)
                            .padding(.top, 8)
                            .padding(.leading, 5)
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.pGrey, lineWidth: 1.5)
                )
                .overlay(
                    Text("(\(newContext.count)/\(contentLimit))")
                        .foregroundColor(newContext.isEmpty ? .gray : .white) // 입력이 비어 있을 때 글자 수 표시를 회색으로 만듭니다.
                        .padding(.leading, 280)
                        .padding(.top, 300)
                )
                .onTapGesture {
                    isFocused = false
                }
                
                
                
                
                Spacer()
                
                
            }
            .padding()
        }
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden()
    }
}

extension WritingDiaryView {
    //일기 추가
    func addDiary() {
        withAnimation {
            let newDiary = dailyDiary(diaryDate: newDate, diaryTitle: newTitle, diaryContent: newContext)
            modelContext.insert(newDiary)
        }
    }
}

extension WritingDiaryView {
    func limitTitle(_ upper: Int) {
        if newTitle.count > upper {
            newTitle = String(newTitle.prefix(upper))
        }
    }
}

extension WritingDiaryView {
    func limitContent(_ upper: Int) {
        if newContext.count > upper {
            newContext = String(newContext.prefix(upper))
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

#Preview {
    WritingDiaryView()
        .modelContainer(for: dailyDiary.self, inMemory: true)
}
