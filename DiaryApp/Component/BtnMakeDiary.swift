//
//  BtnMakeDiary.swift
//  DiaryApp
//
//  Created by 트루디 on 4/10/24.
//

import SwiftUI

struct BtnMakeDiary: View {
    var body: some View {
        Image(systemName: "plus.circle")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(Color.pMint)
    }
}

#Preview {
    BtnMakeDiary()
}
