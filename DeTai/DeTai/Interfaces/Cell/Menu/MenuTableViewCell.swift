//
//  MenuTableViewCell.swift
//  DeTai
//
//  Created by Nhung on 7/24/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    static let identifier:String = "MenuCell"
    class func registerWith(tblView:UITableView) {
        
        tblView.register(UINib(nibName: "MenuCell", bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var titleMenu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgMenu.image = #imageLiteral(resourceName: "original")
        imgMenu.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
