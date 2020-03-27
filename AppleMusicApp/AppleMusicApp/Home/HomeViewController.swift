//
//  HomeViewController.swift
//  AppleMusicApp
//
//  Created by Randy Won on 2020/03/27.
//  Copyright © 2020 Randy Won. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let trackManager: TrackManager = TrackManager()
    // todo : 트랙관리 객체추가
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension HomeViewController: UICollectionViewDataSource {
    // how many
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // todo : 트랙매니저에서 트랙개수 가져오기
        return trackManager.tracks.count
    }
    
    // how 어떻게 표시할까
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // todo : 셀 구성
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        let track = trackManager.track(at: indexPath.item)
        cell.updateUI(item: track)
        return cell
        
    }
    
    // 헤더뷰 어떻게 표시 ?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            //todo header
            return UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    //클릭시 어떻게 할까 ?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // todo 곡 클릭시 플레이어 뷰
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈 어떻게?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //20 - card(width) - 20 - card(width) - 20
        // todo cell size 계산
        let itemSpacing: CGFloat = 20
        let margin: CGFloat = 20
        let width = (collectionView.bounds.width - itemSpacing - 2 * margin)/2
        let height = width + 60
        
        return CGSize(width: width, height: height)
    }
}
