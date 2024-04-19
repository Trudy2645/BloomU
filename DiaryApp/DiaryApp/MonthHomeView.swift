//
//  MonthHomeView.swift
//  DiaryApp
//
//  Created by 트루디 on 4/10/24.
//
import SwiftUI
import SwiftData

struct MonthHomeView: View {
    @State var date = Date()
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Spacer()
                    TopView()
                        .navigationBarHidden(true)
                }
                .padding(.top, 64)
                Spacer()
                
                CalendarView(date: $date)
                    .datePickerStyle(.graphical)
                    .padding(.bottom, 350)
                    .frame(width: 350, height: 320)
                
                NavigationLink(destination: WritingDiaryView()){
                    BtnMakeDiary()
                }
                
                HStack{
                    NavigationLink(destination: DiaryListView(), label: {Text("content")})
                    
                    NavigationLink(destination: FlowerView(), label: {Text("flower")})
                }
                .padding(.bottom)
                
            }
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    MonthHomeView()
        .modelContainer(for: dailyDiary.self, inMemory: true)
    
}
