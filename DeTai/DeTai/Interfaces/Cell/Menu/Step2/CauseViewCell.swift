//
//  CauseViewCell.swift
//  DeTai
//
//  Created by Nhung on 7/29/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class CauseViewCell: UITableViewCell {
    
    static let identifier:String = "CauseViewCell"
    class func registerWith(tblView:UITableView) {
        
        tblView.register(UINib(nibName: "CauseViewCell", bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }

    @IBOutlet weak var lbTitleNN: UILabel!
    @IBOutlet weak var lbNDNN: UILabel!
    @IBOutlet weak var lbTitileHD: UILabel!
    @IBOutlet weak var lbNDHD: UILabel!
    @IBOutlet weak var lbTitleTGQ: UILabel!
    @IBOutlet weak var lbNDTGQ: UILabel!
    @IBOutlet weak var lbYte: UILabel!
    @IBOutlet weak var image114: UIImageView!
    
    var heigthCell : CGFloat?
    var button = [UIButton]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        heigthCell = 60 + lbNDHD.frame.height + lbNDTGQ.frame.height + lbNDNN.frame.height
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initButton(_button: UIButton, _title: String) {
        _button.setTitle(_title, for: UIControlState.normal)
        _button.setTitleColor(UIColor.black, for: UIControlState.normal)
        _button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        _button.layer.borderColor = UIColor.black.cgColor
        _button.backgroundColor = UIColor.init(colorLiteralRed: (255/255), green: (9/255), blue: (102/255), alpha: 1)
        _button.layer.borderWidth = 1
        _button.layer.cornerRadius = 7.0
        button.append(_button)
        _button.addTarget(self, action: #selector(pressButton(button:)), for: .touchUpInside)
        self.addSubview(_button)
    }
    
    func Create(numberButton: Int) {
//        let x = viewDianose.frame.origin.x + 20
//        var y = imageBaby.bounds.width * 1.2 + lbCauHoi.bounds.height + 60
//        button.removeAll()
//        for i in 0..<numberButton {
//            let button = UIButton(frame: CGRect (x: Int(x), y: Int(y), width: 220 , height: 50))
//            initButton(_button: button, _title: titleButton[i])
//            y += 60
//        }
//        heigtView = y
    }
    
    func pressButton(button: UIButton){
        
        
    }

}
