//
//  TGQTableViewCell.swift
//  DeTai
//
//  Created by Nhung on 7/30/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class TGQTableViewCell: UITableViewCell {
    
    static let identifier:String = "TGQTableViewCell"
    class func registerWith(tblView:UITableView) {
        
        tblView.register(UINib(nibName: "TGQTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }

    @IBOutlet weak var imgTGQ: UIImageView!
    @IBOutlet weak var lbNoiDung: UILabel!
    var NDtgq: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func heigtCell() -> CGFloat {
        lbNoiDung.text = NDtgq
        let y = imgTGQ.bounds.height + lbNoiDung.frame.height + 10
        return y
    }
    
}
