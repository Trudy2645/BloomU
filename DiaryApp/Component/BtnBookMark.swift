//
//  BookMarkBtn.swift
//  DiaryApp
//
//  Created by 트루디 on 4/13/24.
//

import SwiftUI

struct BtnBookMark: View {
    var body: some View {
        
        Button(action: {
            print("bookmarkpage")
        }, label: {
            Image(systemName: "bookmark.fill")
                .resizable()
                .frame(width: 18, height: 24)
                .foregroundColor(.pMint)
        })
    }
    
}

#Preview {
    BtnBookMark()
}
