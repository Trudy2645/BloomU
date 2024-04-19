//
//  testView.swift
//  DiaryApp
//
//  Created by 트루디 on 4/17/24.
//


import SwiftUI
import Combine

struct tView: View {

    @State var username = ""

    let textLimit = 10 //Your limit
    
    var body: some View {
        //Your TextField
        TextField("Username", text: $username)
        .onReceive(Just(username)) { _ in limitText(textLimit) }
    }

    //Function to keep text length in limits
    func limitText(_ upper: Int) {
        if username.count > upper {
            username = String(username.prefix(upper))
        }
    }
}

#Preview {
    tView()
}
