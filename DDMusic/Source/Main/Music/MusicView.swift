//
//  MusicView.swift
//  DDMusic
//
//  Created by 남경민 on 12/8/23.
//

import SwiftUI

struct MusicView: View {
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
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 45, height: 24)
                            .background(Color(red: 0.33, green: 0.18, blue: 0.38))
                            .cornerRadius(28)
                        Text("All")
                            .font(.system(size: 18,weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 36, alignment: .center)
                    }
                    Spacer()
                }
                .padding(.bottom,20)
                VStack(spacing:16) {
                    HStack(spacing:16) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 69, height: 62)
                            .background(
                                //Image("PATH_TO_IMAGE")
                                //.resizable()
                                //.aspectRatio(contentMode: .fill)
                                Color.white
                                    .frame(width: 69, height: 62)
                                    .clipped()
                            )
                            .cornerRadius(5)
                        VStack(alignment: .leading,spacing:5) {
                            Text("Those Eyes")
                                .font(.system(size: 15,weight: .semibold))
                                .foregroundColor(.white)
                            Text("New west")
                                .font(.system(size: 13,weight: .light))
                                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                        }
                        Spacer()
                        Image("icon_heart")
                    }
                    HStack(spacing:16) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 69, height: 62)
                            .background(
                                //Image("PATH_TO_IMAGE")
                                //.resizable()
                                //.aspectRatio(contentMode: .fill)
                                Color.white
                                    .frame(width: 69, height: 62)
                                    .clipped()
                            )
                            .cornerRadius(5)
                        VStack(alignment: .leading,spacing:5) {
                            Text("Those Eyes")
                                .font(.system(size: 15,weight: .semibold))
                                .foregroundColor(.white)
                            Text("New west")
                                .font(.system(size: 13,weight: .light))
                                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                        }
                        Spacer()
                        Image("icon_heart_filled")
                    }
                }
                Spacer()
            }
            .padding(.top,100)
            .padding(.horizontal,20)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .ignoresSafeArea()

    }
}

#Preview {
    MusicView()
}
