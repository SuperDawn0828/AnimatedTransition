//
//  DemoCollectionViewController.swift
//  CollectionTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DemoCollectionViewController: UICollectionViewController {
    
    var isPush: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = .white
        
        self.collectionView!.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
    
        cell.imageView.image = UIImage(named: "Wechat-\(indexPath.item)")
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !self.isPush {
            return
        }
        
        
        let width = self.view.bounds.width
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: width, height: width)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let nextVC = DemoCollectionViewController(collectionViewLayout: flowLayout)
        nextVC.collectionView?.isPagingEnabled = true
        nextVC.isPush = false
        nextVC.useLayoutToLayoutNavigationTransitions = true
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
