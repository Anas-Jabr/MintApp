//
//  PagerCollectionViewCell.swift
//  Mint Task
//
//  Created by Anas J on 5/27/21.
//

import UIKit

class PagerCollectionViewCell: UICollectionViewCell {

    @IBOutlet var shadowView: UIView!
    @IBOutlet var bottleCoverImage: UIImageView!
    let bottomArea = UIApplication.shared.windows[0].safeAreaInsets.bottom

    override func awakeFromNib() {
        super.awakeFromNib()
        if bottomArea == 0{
            shadowView.layer.cornerRadius = 27
        }else{
            shadowView.layer.cornerRadius = 35
        }
        shadowView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        bottleCoverImage.transform = bottleCoverImage.transform.rotated(by: .pi/6) 
    }
}
