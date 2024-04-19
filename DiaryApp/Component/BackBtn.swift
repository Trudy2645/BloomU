//
//  BackBtn.swift
//  DiaryApp
//
//  Created by 트루디 on 4/18/24.
//

import SwiftUI

struct BackBtn: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            print("뒤로가기 버튼 눌림")
            dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
                .resizable()
                .frame(width: 13, height: 22)
        })
        .padding(.leading)
        .tint(Color.pMint)
    }
}

#Preview {
    BackBtn()
}
