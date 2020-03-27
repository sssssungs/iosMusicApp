//
//  TrackManager.swift
//  AppleMusicApp
//
//  Created by Randy Won on 2020/03/27.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit
import AVFoundation

class TrackManager {
    // track, album, today's pick
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    init(){
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
    }
    
    // load track
    func loadTracks() -> [AVPlayerItem]{
        // 파일을 읽어서 avplayer item 만들기
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? [] //Bundle : 현재 앱 객체.
//        var items: [AVPlayerItem] = []
//        for url in urls {
//            let item = AVPlayerItem(url: url)
//            items.append(item)
//        }
        // closure로 map 사용
        let items = urls.map { url in // >> { AVPlayerItem(url: $0) } 형태로 변환가능 $0 : map에서 첫번째 들어오는 인수.
            return AVPlayerItem(url: url)
        }
        return items
    }
    // load track by index
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
//        playerItem > Track
        return playerItem.convertToTrack()
    }

    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList: [Track] = tracks.compactMap { $0.convertToTrack() }
        let albumDics = Dictionary(grouping: trackList, by: { (track) in track.albumName })
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        
        return albums
    }
    
    func loadOtherTodaysTrack() {
        self.todaysTrack = self.tracks.randomElement()
    }
}
