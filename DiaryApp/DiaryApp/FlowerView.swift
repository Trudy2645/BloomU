//
//  FlowerView.swift
//  DiaryApp
//
//  Created by 트루디 on 4/18/24.
//

import SwiftUI

struct FlowerView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    
    var body: some View {
        VStack{
            HStack{
                BackBtn()
                Spacer()
                TopView()
            }
            .navigationBarBackButtonHidden()
            
            //            Button("Tap count: \(tapCount)") {
            //                self.tapCount += 1
            //                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            //            }
            //            Spacer()
            
            Image("Lev5")
                .resizable()
                .frame(width: 150, height: 220)
            HStack{
                Image(systemName: "chevron.backward.circle")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .foregroundColor(Color.pMint)
                Text("6 / 7 단계")
                    .bold()
                Image(systemName: "chevron.right.circle")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .foregroundColor(Color.pMint)
                
            }
            
            Text("나의 하루에 물을 준 일 수 : 21일")
            
            WaterBox(waterInfo: "Water : 2024.04.18    Lv.6")
            WaterBox(waterInfo: "Water : 2024.04.17    Lv.5")
            WaterBox(waterInfo: "Water : 2024.04.15    Lv.5")
            WaterBox(waterInfo: "Water : 2024.04.14    Lv.5")
            WaterBox(waterInfo: "Water : 2024.04.14    Lv.5")
            WaterBox(waterInfo: "Water : 2024.04.13    Lv.5")
            WaterBox(waterInfo: "Water : 2024.04.13    Lv.5")
//            WaterBox(waterInfo: "Water : 2024.04.12    Lv.4")
            
        }
    }
}

#Preview {
    FlowerView()
        .preferredColorScheme(.dark)
}

struct WaterBox: View {
    let waterInfo: String

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.pGrey, lineWidth: 1.5)
            .frame(width: 300, height: 35)
            .padding(2)
            .overlay(
                Text(waterInfo)
                    .foregroundColor(Color.white)
            )
    }
}

