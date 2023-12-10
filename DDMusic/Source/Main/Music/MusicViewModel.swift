//
//  MusicViewModel.swift
//  DDMusic
//
//  Created by 남경민 on 12/10/23.
//

import Foundation
import SwiftCSV

final class MusicViewModel : ObservableObject {
    @Published var songs : [Song] = []
    
    func loadCsvFile() {
        // CSV 파일의 경로나 URL
        
        do {
            let filePath = Bundle.main.path(forResource: "final_songs", ofType: "csv")!
            let csvFile: CSV = try CSV<Named>(url: URL(fileURLWithPath: filePath))
            // 각 행을 반복하여 Song 객체 생성
            for row in csvFile.rows {
                if let songID = row["SongID"],
                   let title = row["Title"],
                   let singer = row["Singer"], let album = row["AlbumImageURL"]{
                    let song = Song(songId: songID, title: title, artist: singer,album:album)
                    songs.append(song)
                }
            }
            print(songs)
        } catch {
            print("파일 읽기 오류: \(error)")
        }
    }
}
