//
//  InfoStep1CellTableViewCell.swift
//  DeTai
//
//  Created by FunTap on 6/13/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

protocol InfoStep1CellTableViewCellDelegate {
    func infoStepCellTableViewCell(infoStepCellTableViewCell: InfoStep1CellTableViewCell, didChangeValue value: Bool)
}



class InfoStep1CellTableViewCell: UITableViewCell {

    @IBOutlet weak var imgStep1: UIImageView!
    @IBOutlet weak var lbInfoStep1: UILabel!
    @IBOutlet weak var lbldetail: UILabel!
    
    var delegate : InfoStep1CellTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
                // Configure the view for the selected state
    }

}
