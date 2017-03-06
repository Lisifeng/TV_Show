//
//  HomeViewCell.swift
//  TV_Show
//
//  Created by 郑娇鸿 on 17/3/4.
//  Copyright © 2017年 郑娇鸿. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewCell: UICollectionViewCell {
    // MARK: 控件属性
    var albumImageView: UIImageView!
    var liveImageView: UIImageView!
    var nickNameLabel: UILabel!
    var onlinePeopleLabel: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.buildCell()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        self.buildCell()
//        
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        albumImageView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(self.contentView)

        }
        
        liveImageView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(self.contentView).offset(-8)
            ConstraintMaker.top.equalTo(self.contentView).offset(8)
            ConstraintMaker.width.equalTo(23)
            ConstraintMaker.height.equalTo(13)

        }
        
        nickNameLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(self.onlinePeopleLabel.snp.left).offset(8)
            ConstraintMaker.left.equalTo(self.contentView).offset(8)
            ConstraintMaker.bottom.equalTo(self.contentView).offset(-8)
            ConstraintMaker.height.equalTo(15)

            
        }
        
        onlinePeopleLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.right.equalTo(self.contentView).offset(-8)
            ConstraintMaker.bottom.equalTo(self.contentView).offset(-8)
            ConstraintMaker.width.equalTo(60)
            ConstraintMaker.height.equalTo(12)
        }
        
    }
    // MARK: 定义属性
    var anchorModel : AnchorModel? {
        didSet {
            albumImageView.setImage(anchorModel!.isEvenIndex ? anchorModel?.pic74 : anchorModel?.pic51, "home_pic_default")
            liveImageView.isHidden = anchorModel?.live == 0
            nickNameLabel.text = anchorModel?.name
            onlinePeopleLabel.setTitle("\(anchorModel?.focus ?? 0)", for: .normal)
        }
    }
  
}

extension HomeViewCell {
    
    func buildCell() -> () {
        albumImageView = UIImageView.init()
        self.contentView.addSubview(albumImageView)
        
        liveImageView = UIImageView.init(image: UIImage.init(named: "home_icon_live"))
        self.contentView.addSubview(liveImageView)
        
        nickNameLabel = UILabel.init()
        self.contentView.addSubview(nickNameLabel)
    
        onlinePeopleLabel = UIButton.init(type: UIButtonType.custom)
        onlinePeopleLabel.imageView?.image = UIImage.init(named: "home_icon_people")
        onlinePeopleLabel.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: 0)
        self.contentView.addSubview(onlinePeopleLabel)
        
    }
}
