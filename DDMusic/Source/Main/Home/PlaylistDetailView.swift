//
//  PlaylistDetailView.swift
//  DDMusic
//
//  Created by 남경민 on 12/11/23.
//

import Foundation
import Kingfisher
import SwiftUI
import Combine

struct PlaylistDetailView: View {
    @StateObject var viewModel = HomeViewModel()
    @Binding var title : String
    @Binding var image : Image
    @Binding var isActive : Bool
    @State var type : RecommendationType? = nil
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
                ZStack {
                    HStack {
                        Image("back")
                            .onTapGesture {
                                self.isActive = false
                            }
                        Spacer()
                    }
                    Text("\(title)")
                        .font(.system(size: 18,weight: .bold))
                        .foregroundColor(.white)
                }
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 135)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.bottom,20)
                ScrollView(showsIndicators:false) {
                    ForEach(viewModel.initialSongs, id:\.self) { song in
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
                
                        }
                    }
                }

            }
            .padding(.top, 60)
            .padding(.horizontal,20)
            .padding(.bottom,100)
            .onAppear {
                if let type = type {
                    viewModel.loadCsvFile(type: type)
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PlaylistDetailView(title: .constant("title"), image: .constant(Image("initial_cover_image")), isActive: .constant(true))
}
