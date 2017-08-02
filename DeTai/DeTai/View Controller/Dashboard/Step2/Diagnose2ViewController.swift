//
//  Diagnose2ViewController.swift
//  DeTai
//
//  Created by Nhung on 7/29/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class Diagnose2ViewController: UIViewController {

    class func newVC(storyBoard:UIStoryboard) -> Diagnose2ViewController {
        
        let newVC = storyBoard.instantiateViewController(withIdentifier: "Diagnose2ViewController") as! Diagnose2ViewController
        return newVC
    }
    
    @IBOutlet weak var tbvChuanDoan2: UITableView!
    
    var MaCHDT: String?
    var cauhoi: CAUHOI?
    var CTL = [CAUTRALOI]()
    var NDCTL = [String]()
    var heigthRow: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        Dianose2ViewCell.registerWith(tblView: tbvChuanDoan2)
        loadData(maCHDT: MaCHDT!)
        tbvChuanDoan2.delegate = self
        tbvChuanDoan2.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(maCHDT: String) {
        CTL.removeAll()
        NDCTL.removeAll()
        cauhoi = ChuanDoanBaseDataStore.shared.getAllData(MaCH: maCHDT)
        CTL = ChuanDoanBaseDataStore.shared.getCAUTRALOI(MaCH: maCHDT)
        for item in CTL {
            NDCTL.append(item.NDCTL)
        }
        tbvChuanDoan2.reloadData()
    }

}

extension Diagnose2ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Dianose2ViewCell", for: indexPath) as! Dianose2ViewCell
        cell.delegate = self
        cell.indexth = indexPath
        cell.lbCauHoi.text = cauhoi?.NDCH
        cell.titleButton = NDCTL
        for item in cell.button {
            item.removeFromSuperview()
        }
        cell.Create(numberButton: CTL.count)
        heigthRow = cell.heigtView
        cell.CTL = CTL
        cell.CH = cauhoi!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heigthRow + 50
    }
}

extension Diagnose2ViewController: Dianose2ViewCellDelegate {
    func RequestCauHoi(maCH: String,maNN: String, TT: String, index: IndexPath) {
        if TT == "0" {
            if maCH != "NULL" {
                loadData(maCHDT: maCH)
            }
            if maNN != "NULL" {
                let newVC = CauseViewController.newVC(storyBoard: self.storyboard!)
                newVC.loadData(MaNN: maNN)
                self.navigationController?.pushViewController(newVC, animated: true)
            }
        } else if TT == "1" {
            
        }else if TT == "2" {
            let backVC = DiagnoseViewController.newVC(storyBoard: self.storyboard!)
            backVC.loadTC(MaTC: maCH)
            self.navigationController?.pushViewController(backVC, animated: true)
        }
    }
}
