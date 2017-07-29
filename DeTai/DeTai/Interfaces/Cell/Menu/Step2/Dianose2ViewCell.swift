//
//  Dianose2ViewCell.swift
//  DeTai
//
//  Created by Nhung on 7/29/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

protocol Dianose2ViewCellDelegate {
    func RequestCauHoi(maCH: String, TT: String, index: IndexPath)
}

class Dianose2ViewCell: UITableViewCell {
    
    static let identifier:String = "Dianose2ViewCell"
    class func registerWith(tblView:UITableView) {
        
        tblView.register(UINib(nibName: "Dianose2ViewCell", bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }

    @IBOutlet weak var imageBaby: UIImageView!
    @IBOutlet weak var viewDianose: UIView!
    @IBOutlet weak var lbCauHoi: UILabel!
    
    var CTL = [CAUTRALOI]()
    var titleButton = [String]()
    var heigtView = CGFloat()
    var delegate: Dianose2ViewCellDelegate?
    var indexth: IndexPath?
    var button = [UIButton]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    func setupCell() {
        // set view
        viewDianose.layer.borderWidth = 1
        viewDianose.layer.borderColor = UIColor.red.cgColor
        viewDianose.layer.cornerRadius = 5
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
        let x = viewDianose.frame.origin.x + 20
        var y = imageBaby.bounds.width * 1.2 + lbCauHoi.bounds.height + 60
        button.removeAll()
        for i in 0..<numberButton {
            let button = UIButton(frame: CGRect (x: Int(x), y: Int(y), width: 220 , height: 50))
            initButton(_button: button, _title: titleButton[i])
            y += 60
        }
        heigtView = y
    }
    
    func pressButton(button: UIButton){
        
       for item in CTL {
            if button.titleLabel?.text == item.NoiDungCTL {
                delegate?.RequestCauHoi(maCH: item.MaCHTT, TT: item.MaTT, index: indexth!)
            }
        }
    }


}
