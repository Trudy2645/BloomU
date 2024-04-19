//
//  WritingDiaryView.swift
//  DiaryApp
//
//  Created by 트루디 on 4/10/24.
//

import SwiftUI

struct WritingDiaryView: View {
    var body: some View {
        VStack{
                
            WriteField()
            Spacer()
            
        }
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WritingDiaryView()
}
