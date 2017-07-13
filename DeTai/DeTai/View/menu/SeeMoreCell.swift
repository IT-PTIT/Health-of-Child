//
//  SeeMoreCell.swift
//  DeTai
//
//  Created by phungducchinh on 7/13/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class SeeMoreCell: UITableViewCell {

    @IBOutlet weak var lblSeemore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        lblSeemore.text = "Xem thêm"
//        lblSeemore.textAlignment = .center
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        lblSeemore.text = "Xem thêm"
        lblSeemore.textAlignment = .center

        // Configure the view for the selected state
    }

}
