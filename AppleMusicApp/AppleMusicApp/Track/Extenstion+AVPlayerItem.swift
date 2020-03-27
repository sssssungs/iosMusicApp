//
//  Extenstion+AVPlayerItem.swift
//  AppleMusicApp
//
//  Created by Randy Won on 2020/03/27.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit
import AVFoundation

extension AVPlayerItem {
    func convertToTrack() -> Track? {
        let metadataList = asset.metadata
        
        var trackTitle: String?
        var trackArtist: String?
        var trackAlbumName: String?
        var trackArtwork: UIImage?
        
        for metadata in metadataList {
            if let title = metadata.title {
                trackTitle = title
            }
            
            if let artist = metadata.artist {
                trackArtist = artist
            }
            
            if let albumName = metadata.albumName {
                trackAlbumName = albumName
            }
            
            if let artwork = metadata.artwork {
                trackArtwork = artwork
            }
        }
        
        guard let title = trackTitle, let artist = trackArtist, let albumName = trackAlbumName, let artwork = trackArtwork
            else { return nil }
        return Track(title: title, artist: artist, albumName: albumName, artwork: artwork)
    }
}

extension AVMetadataItem {
    var title: String? {
        guard let key = commonKey?.rawValue, key == "title" else {
            return nil
        }
        return stringValue
    }
    
    var artist: String? {
        guard let key = commonKey?.rawValue, key == "artist" else {
            return nil
        }
        return stringValue
    }
    
    var albumName: String? {
        guard let key = commonKey?.rawValue, key == "albumName" else {
            return nil
        }
        return stringValue
    }
    
    var artwork: UIImage? {
        guard let key = commonKey?.rawValue, key == "artwork", let data = dataValue, let image = UIImage(data: data) else {
            return nil
        }
        return image
    }
    
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
