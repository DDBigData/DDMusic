//
//  HomeViewModel.swift
//  DDMusic
//
//  Created by 남경민 on 12/11/23.
//

import Foundation
import SwiftCSV
import Combine
enum RecommendationType {
    case initial
    case songsentence
    case lyric
    case songsentenceLyric
    case audio
}

final class HomeViewModel : ObservableObject {
    var initialSongId = [188668,33264943,33483664,30997607,33412196,35411219,33340515,32376333,32390567,33301174]
    var songsentenceSongId = [33334136, 34701954, 8271355, 31562554, 31184764, 30732377, 30038185, 31098679, 4182990, 30707718, 31376041, 36430774, 36430773, 36799775, 36799774, 36365073, 36779485, 36564724, 33030421, 36599949]
    var lyricSongId = [31184764, 34270805, 33301174, 35003354, 4182990, 33480898, 36613696, 35642015, 34481680, 33413898, 33264943, 33483664, 33552335, 31571110, 33160206, 2710613, 36290218, 34415838, 34101563, 36546922]
    var audioSongId = [5372667, 30688502, 31901475, 32243272, 32450201, 33898950, 34061322, 34787226, 35890454, 36180700, 36365073, 36382580, 36546923, 36632907, 36799774]
    
    @Published var initialSongs : [Song] = []
    func loadCsvFile(type: RecommendationType) {
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
                    switch type {
                    case .initial :
                        if initialSongId.contains(Int(songID)!) {
                            initialSongs.append(song)
                        }
                    case .songsentence :
                        if songsentenceSongId.contains(Int(songID)!) {
                            initialSongs.append(song)
                        }
                    case .lyric :
                        if lyricSongId.contains(Int(songID)!) {
                            initialSongs.append(song)
                        }
                    case .songsentenceLyric:
                        if initialSongId.contains(Int(songID)!) {
                            initialSongs.append(song)
                        }
                    case .audio :
                        if audioSongId.contains(Int(songID)!) {
                            initialSongs.append(song)
                        }
                    
                    }
                    
                }
            }
            print(initialSongs)
         
        } catch {
           
            print("파일 읽기 오류: \(error)")
        }

    }
}
