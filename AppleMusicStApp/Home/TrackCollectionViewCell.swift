//
//  TrackCollectionViewCell.swift
//  AppleMusicApp
//
//  Created by Randy Won on 2020/03/27.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    override func awakeFromNib() { // storyboard에서 앱으로 로딩될때. ( Nib = storyboard )
        super.awakeFromNib()
        trackThumbnail.layer.cornerRadius = 4
        trackArtist.textColor = UIColor.systemGray2
    }
    
    func updateUI(item: Track?){
        //todo 곡정보
        guard let track = item else { return }
        trackThumbnail.image = track.artwork
        trackTitle.text = track.title
        trackArtist.text = track.artist
        
    }
    
}
