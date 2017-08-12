//
//  CauseViewController.swift
//  DeTai
//
//  Created by Nhung on 7/29/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class CauseViewController: UIViewController {
    
    class func newVC(storyBoard:UIStoryboard) -> CauseViewController {
        
        let newVC = storyBoard.instantiateViewController(withIdentifier: "CauseViewController") as! CauseViewController
        return newVC
    }

    @IBOutlet weak var tbvCause: UITableView!
    var NguyenNhan = NGUYENNHAN()
    var TGQ = [TUGIAIQUYET]()
    var nameTGQ = [String]()
    var heigtRow: CGFloat? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = ""
        title = "Kết Quả"
        // Do any additional setup after loading the view.
        CauseViewCell.registerWith(tblView: tbvCause)
        tbvCause.delegate = self
        tbvCause.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(MaNN: String) {
        TGQ.removeAll()
        nameTGQ.removeAll()
        NguyenNhan = NNBaseDataStore.shared.getAllData(MaNN: MaNN)
        if NguyenNhan.MaTTTGQ == "1" {
            TGQ = TGQBaseDataStore.shared.getAllData(MaNN: MaNN)
            for item in TGQ {
                nameTGQ.append(item.TenTGQ)
            }
        }
    }
    
}

extension CauseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CauseViewCell", for: indexPath) as! CauseViewCell
        cell.delegate = self
        cell.lbNDNN.text = NguyenNhan.NDNN
        cell.lbYte.text = NguyenNhan.NDHD
        cell.lbNDTGQ.text = NguyenNhan.TGQ
        cell.titleButton = nameTGQ
        cell.TGQ = TGQ
        cell.Create(numberButton: TGQ.count)
        heigtRow = cell.heigthCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heigtRow! + 50
    }
}

extension CauseViewController: CauseViewCellDelegate {
    func RequestTGQ(maTGQ: String) {
        let newVC = TGQViewController.newVC(storyBoard: self.storyboard!)
        for item in TGQ {
            if item.MaTGQ == maTGQ {
                newVC.tgq = item
                self.navigationController?.pushViewController(newVC, animated: true)
            }
        }
    }
}
