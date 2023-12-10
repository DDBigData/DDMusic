//
//  PlaylistView.swift
//  DDMusic
//
//  Created by 남경민 on 12/10/23.
//

import SwiftUI

struct PlaylistView: View {
    var body: some View {
        ZStack {
            Color.grey1
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.58, green: 0, blue: 1).opacity(0.7), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.58, green: 0, blue: 1).opacity(0.14), location: 0.27),
                    Gradient.Stop(color: Color(red: 0.58, green: 0, blue: 1).opacity(0), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.11, y: -0.05),
                endPoint: UnitPoint(x: 1, y: 1)
            )
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    PlaylistView()
}
