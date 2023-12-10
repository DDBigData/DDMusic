//
//  SplashScreen.swift
//  DDMusic
//
//  Created by 남경민 on 12/8/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var hasSeenKeywordView: Bool = UserDefaults.standard.bool(forKey: "HasSeenKeywordView")
    var body: some View {
        if isActive {
            if !hasSeenKeywordView {
                SelectKeywordView()
            } else {
                
            }
            
        } else {
            ZStack {
                Image("splash_bg")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .ignoresSafeArea()
                Image("illust_splash")
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                   
                }
                
            }
        }
    }
}

#Preview {
    SplashScreen()
}
