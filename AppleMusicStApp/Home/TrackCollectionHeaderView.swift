//
//  TrackCollectionHeaderViewCollectionReusableView.swift
//  AppleMusicApp
//
//  Created by Randy Won on 2020/03/27.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit
import AVFoundation

class TrackCollectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: AVPlayerItem?
    var tapHandler: ((AVPlayerItem) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumnailImageView.layer.cornerRadius = 4
    }
    
    func update(with item: AVPlayerItem){
        self.item = item
        guard let track = item.convertToTrack() else { return }
        
        self.thumnailImageView.image = track.artwork
        self.descriptionLabel.text = "Today's Pick is \(track.artist)'s album - \(track.albumName)" 
    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        guard let todaysItem = item else { return }
        tapHandler?(todaysItem)
    }
}
