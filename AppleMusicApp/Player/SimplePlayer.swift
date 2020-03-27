//
//  SimplePlayer.swift
//  AppleMusicApp
//
//  Created by Randy Won on 2020/03/27.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit
import AVFoundation

class SimplePlayer {
    
    private let player = AVPlayer()
    
    var currentTime: Double {
        return 0.0
    }
    
    var totalDurationTime: Double {
        return 0.0
    }
    
    var isPlaying: Bool {
        return false
    }
    
//    var currentTime: AVPlayerItem? {
//        return nil
//    }
//
    init() {}
    
    func pause(){}
    
    func play(){}

}
