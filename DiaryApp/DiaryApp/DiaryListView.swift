//
//  ContentView.swift
//  DiaryApp
//
//  Created by 트루디 on 4/9/24.
//

import SwiftUI
import SwiftData

struct DiaryListView: View {
    @Environment(\.modelContext) private var modelcontext
    @Query(sort: \dailyDiary.diaryDate, order: .reverse) var dailydiary: [dailyDiary]
    
    var body: some View {
        VStack{
            HStack{
                BackBtn()
                Spacer()
                TopView()
            }
            .navigationBarBackButtonHidden()
                
        NavigationStack {
            
                List {
                    ForEach(dailydiary, id: \.self) { diary in
                        
                        NavigationLink(destination: DetailContentView(diary: diary)) {
                            HStack{
                                Text(diary.diaryDate.format("YYYY.M.d"))
                                Text("\(diary.diaryTitle)")
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
                                BtnBookMark(diary: diary)
                                    .tint(diary.isBookmarked ? Color.pMint : Color.pGrey)
                            })
                            .listRowBackground(Color.pGrey)
                            
                        }
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet {
                            let diary = dailydiary[index]
                            modelcontext.delete(diary)
                            try? modelcontext.save()
                        }
                    })
                    
                }
                
                NavigationLink(destination: WritingDiaryView()) {
                    Text("글쓰기")
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    func BtnBookMark(diary: dailyDiary) -> some View {
        Button(role: .cancel) {
            diary.isBookmarked.toggle()
            print(diary.isBookmarked)
        } label: {
            Image(systemName: diary.isBookmarked ? "bookmark.fill" : "bookmark.slash.fill")
                .resizable()
                .frame(width: 18, height: 24)
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    DiaryListView()
        .modelContainer(for: dailyDiary.self, inMemory: true)
}
