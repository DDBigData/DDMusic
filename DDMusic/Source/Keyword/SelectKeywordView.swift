//
//  SelectKeywordView.swift
//  DDMusic
//
//  Created by 남경민 on 12/8/23.
//

import SwiftUI

struct SelectKeywordView: View {
    var body: some View {
        ZStack {
            Image("splash_bg")
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .ignoresSafeArea()
            VStack {
                Text("좋아하는 분위기가 있나요?")
                    .font(.system(size: 38,weight: .bold))
                    .foregroundColor(.white)
                
                
            }
            

        }
    }
}

#Preview {
    SelectKeywordView()
}
