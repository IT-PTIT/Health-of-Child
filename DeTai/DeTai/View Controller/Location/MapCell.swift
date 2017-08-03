//
//  MapCell.swift
//  DeTai
//
//  Created by phungducchinh on 8/2/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class MapCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgHospital: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
