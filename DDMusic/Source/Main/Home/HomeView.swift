//
//  HomeView.swift
//  DDMusic
//
//  Created by 남경민 on 12/10/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var title = ""
    @State var image = Image("")
    @State var isActive = false
    var body: some View {
        NavigationView {
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
                        Text("반가워요. SOM님!")
                            .font(.system(size: 25, weight: .semibold))
                            .foregroundColor(.white)
                        Spacer()
                        Image("image_profile")
                    }
                    .padding(.top, 100)
                    VStack(spacing:14) {
                        HStack {
                            VStack(alignment: .leading,spacing: 6) {
                                Text("Enjoy your mood")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Text("당신의 분위기와 어울리는 노래")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        
                        ScrollView(.horizontal,showsIndicators:false) {
                            NavigationLink(destination: PlaylistDetailView(title: $title, image: $image, isActive: $isActive, type:.initial), isActive: $isActive) {
                                VStack(spacing:10) {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 152, height: 149)
                                        .background(
                                            Image("initial_cover_image")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 152, height: 149)
                                                .clipped()
                                        )
                                        .cornerRadius(5)
                                    
                                    Text("잠들기 전에 듣는 잔잔한 감성")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(Color(red: 0.59, green: 0.55, blue: 0.55))
                                }
                                .onTapGesture {
                                    title = "잠들기 전에 듣는 잔잔한 감성"
                                    image = Image("initial_cover_image")
                                    isActive = true
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                    
                    VStack(spacing:14) {
                        HStack {
                            Text("Recommended")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators:false) {
                            HStack(spacing:22) {
                                NavigationLink(destination: PlaylistDetailView(title: $title, image: $image, isActive: $isActive, type:.songsentence), isActive: $isActive) {
                                    VStack(spacing:10) {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 152, height: 149)
                                            .background(
                                                Image("songsentence_cover_image")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 152, height: 149)
                                                    .clipped()
                                            )
                                            .cornerRadius(5)
                                        
                                        Text("감성힙합으로 마음을 위로해보세요")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(Color(red: 0.59, green: 0.55, blue: 0.55))
                                    }
                                    .onTapGesture {
                                        title = "감성힙합으로 마음을 위로해보세요"
                                        image = Image("songsentence_cover_image")
                                        isActive = true
                                    }
                                }
                                NavigationLink(destination: PlaylistDetailView(title: $title, image: $image, isActive: $isActive, type:.lyric), isActive: $isActive) {
                                    VStack(spacing:10) {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 152, height: 149)
                                            .background(
                                                Image("lyric_cover_image")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 152, height: 149)
                                                    .clipped()
                                            )
                                            .cornerRadius(5)
                                        Text("위로를 전하는 감성의 노래")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(Color(red: 0.59, green: 0.55, blue: 0.55))
                                    }
                                    .onTapGesture {
                                        title = "위로를 전하는 감성의 노래"
                                        image = Image("lyric_cover_image")
                                        isActive = true
                                    }
                                }
                                NavigationLink(destination: PlaylistDetailView(title: $title, image: $image, isActive: $isActive, type:.audio), isActive: $isActive) {
                                    VStack(spacing:10) {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 152, height: 149)
                                            .background(
                                                Image("audio_cover_image")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 152, height: 149)
                                                    .clipped()
                                            )
                                            .cornerRadius(5)
                                        Text("열정을 불태워보세요")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(Color(red: 0.59, green: 0.55, blue: 0.55))
                                    }
                                    .onTapGesture {
                                        title = "열정을 불태워보세요"
                                        image = Image("audio_cover_image")
                                        isActive = true
                                    }
                                }
                            }
                        }
                        
                    }
                    .padding(.top, 20)
                     
                    Spacer()
                }
                .padding(.horizontal, 20)
                .onAppear {
                    viewModel.loadCsvFile(type: .initial)
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
        }.navigationViewStyle(.stack)
    }
}

#Preview {
    HomeView()
}
