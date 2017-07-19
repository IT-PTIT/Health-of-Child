//
//  HomeCell.swift
//  DeTai
//
//  Created by Nhung on 7/18/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    static let identifier:String = "HomeCell"
    class func registerWith(collectionView:UICollectionView) {
        
        collectionView.register(UINib(nibName: "HomeCell", bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
    }
    
    @IBOutlet weak var imageStep: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    var data: Categories! {
        didSet {
            imageStep.image = data.image
            labelName.text = data.name
        }
    }
    
    override func awakeFromNib() {
        imageStep.layer.cornerRadius = 5.0
        self.layer.cornerRadius = 5.0
    }
}
