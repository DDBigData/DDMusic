//
//  PlaylistView.swift
//  DDMusic
//
//  Created by 남경민 on 12/10/23.
//

import SwiftUI
import Kingfisher

struct PlaylistView: View {
    @StateObject var viewModel = PlaylistViewModel()
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
                    Text("My Playlist")
                        .font(.system(size: 18,weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 100, alignment: .center)
                    Spacer()
                }
                .padding(.bottom,20)
                VStack(spacing:16) {
                    ScrollView(showsIndicators:false) {
                        ForEach(viewModel.songs, id:\.self) { song in
                            HStack(spacing:16) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 69, height: 62)
                                    .background(
                                        KFImage(URL(string : song.album))
                                            .placeholder {
                                                Color.white
                                                    .frame(width: 69, height: 62)
                                                    .clipped()
                                            }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                                            .onSuccess { success in //성공
                                                print("success: \(success)")
                                            }
                                            .onFailure { error in //실패
                                                print("failure: \(error)")
                                            }

                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 69, height: 62)
                                        .clipped()
                                    )
                                    .cornerRadius(5)
                                VStack(alignment: .leading,spacing:5) {
                                    Text("\(song.title)")
                                        .font(.system(size: 15,weight: .semibold))
                                        .foregroundColor(.white)
                                    Text("\(song.artist)")
                                        .font(.system(size: 13,weight: .light))
                                        .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                                }
                                Spacer()
                                Image("icon_heart_filled")
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.top,100)
            .padding(.horizontal,20)
            .onAppear {
                viewModel.loadCsvFile()
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .ignoresSafeArea()

    }
}

#Preview {
    PlaylistView()
}
