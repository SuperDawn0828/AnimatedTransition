//
//  ImageCollectionViewCell.swift
//  CollectionTransitionDemo
//
//  Created by 黎明 on 2017/8/14.
//  Copyright © 2017年 黎明. All rights reserved.
//

import UIKit
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    private(set) var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.imageView = UIImageView()
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.masksToBounds = true
        contentView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { [unowned self] (make) in
            make.edges.equalTo(self.contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
