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
        
    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        
    }
}
