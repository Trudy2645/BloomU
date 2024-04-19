//
//  TopView.swift
//  DiaryApp
//
//  Created by 트루디 on 4/17/24.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        NavigationStack{
            HStack{
                NavigationLink(destination: MonthHomeView(), label: {Image("Bloom")
                        .padding(.trailing,104)
                })

                
                NavigationLink(destination: BookmarkedDiary(), label: {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .frame(width: 18, height: 24)
                        .foregroundColor(.pMint)
                        .padding(.trailing, 20)
                })
                
            }
        }
    }
}

#Preview {
    TopView()
        .preferredColorScheme(.dark)
}
