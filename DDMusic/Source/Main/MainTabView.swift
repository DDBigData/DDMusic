//
//  MainTabView.swift
//  DDMusic
//
//  Created by 남경민 on 12/8/23.
//

import SwiftUI

struct MainTabView: View {
    @State var selection = 0
    let icons = ["icon_home_inactive","icon_search_inactive","icon_playlist_inactive"]
    let selectedIcons = ["icon_home_active","icon_search_active","icon_playlist_active"]

    var body: some View {
        ZStack {
            VStack {
                switch selection {
                case 0:
                    NavigationView {

                    }
                    .navigationViewStyle(.stack)
                case 1:
                    NavigationView {
  
                    }.navigationViewStyle(.stack)
                default :
                    NavigationView {
                  
                    }.navigationViewStyle(.stack)
                }
                //}
            }
            VStack {
                Spacer()
                HStack(spacing: 77) {
                    Button {
                        self.selection = 0
                    } label: {
                        Image(selection == 0 ? selectedIcons[0] : icons[0])
                    }
                    Button {
                        self.selection = 1
                    } label: {
                        
                        Image(selection == 1 ? selectedIcons[1] : icons[1])

                    }
                    Button {
                        self.selection = 2
                    } label: {
                        
                        Image(selection == 2 ? selectedIcons[2] : icons[2])
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height:76)
                .background(Color.grey1)
                
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
