//
//  DiagnoseCell.swift
//  DeTai
//
//  Created by Nhung on 7/28/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

protocol DiagnoseCellDelegate {
   func diagnoseCell(maCH: String)
}

class DiagnoseCell: UITableViewCell {
    
    static let identifier:String = "DiagnoseCell"
    class func registerWith(tblView:UITableView) {
        
        tblView.register(UINib(nibName: "DiagnoseCell", bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }
    
    var MaCH: String?
    var delegate: DiagnoseCellDelegate?
    
    @IBOutlet weak var lbMoTa: UILabel!
    @IBOutlet weak var viewDauHieu: UIView!
    @IBOutlet weak var lbTitleDauHieu: UILabel!
    @IBOutlet weak var lbDauHieu: UILabel!
    @IBOutlet weak var btBatDau: UIButton!
    @IBOutlet weak var imageTitle: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    func setupCell() {
        // set view
        viewDauHieu.layer.borderWidth = 1
        viewDauHieu.layer.borderColor = UIColor.red.cgColor
        viewDauHieu.layer.cornerRadius = 5
        // set button
        btBatDau.layer.cornerRadius = 10
        btBatDau.layer.borderColor = UIColor.black.cgColor
        btBatDau.layer.borderWidth = 1
    }

    @IBAction func BatDauAction(_ sender: Any) {
       delegate?.diagnoseCell(maCH: MaCH!)
    }
}
