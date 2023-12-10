//
//  HomeViewModel.swift
//  DDMusic
//
//  Created by 남경민 on 12/11/23.
//

import Foundation
import SwiftCSV
import Combine

final class HomeViewModel : ObservableObject {
    var initialSongId = [188668,33264943,33483664,30997607,33412196,35411219,33340515,32376333,32390567,33301174]
    @Published var initialSongs : [Song] = []
    
    func loadCsvFile() {
        // CSV 파일의 경로나 URL
        do {
            initialSongs = []
            let filePath = Bundle.main.path(forResource: "final_songs", ofType: "csv")!
            let csvFile: CSV = try CSV<Named>(url: URL(fileURLWithPath: filePath))
            // 각 행을 반복하여 Song 객체 생성
            for row in csvFile.rows {
                if let songID = row["SongID"],
                   let title = row["Title"],
                   let singer = row["Singer"], let album = row["AlbumImageURL"]{
                    let song = Song(songId: songID, title: title, artist: singer,album:album)
                    if initialSongId.contains(Int(songID)!) {
                        initialSongs.append(song)
                    }
                }
            }
            print(initialSongs)
         
        } catch {
           
            print("파일 읽기 오류: \(error)")
        }

    }
}
