//
//  DiagnoseViewController.swift
//  DeTai
//
//  Created by Nhung on 7/28/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class DiagnoseViewController: UIViewController {
    
    class func newVC(storyBoard:UIStoryboard) -> DiagnoseViewController {
        
        let newVC = storyBoard.instantiateViewController(withIdentifier: "DiagnoseViewController") as! DiagnoseViewController
        return newVC
    }

    @IBOutlet weak var tbvDiagnose: UITableView!
    
    var trieuchung: TRIEUCHUNG?
    var heigtRow: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem?.title = ""
        title = "Chẩn Đoán"
        DiagnoseCell.registerWith(tblView: tbvDiagnose)
        tbvDiagnose.delegate = self
        tbvDiagnose.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadTC(MaTC: String) {
        trieuchung = TrieuChungBaseDataStore.shared.getTrieuChung(MaTC: MaTC)
    }

}

extension DiagnoseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiagnoseCell", for: indexPath) as! DiagnoseCell
        cell.MaCH = trieuchung?.MaCHDT
        cell.delegate = self
        if trieuchung?.DauHieu == "NULL" {
            cell.viewDauHieu.isHidden = true
            cell.lbMoTa.text = trieuchung?.MoTa
            cell.lbTitle.text = trieuchung?.TenTC
            cell.imageTitle.image = #imageLiteral(resourceName: "sleeping")
        } else {
            cell.viewDauHieu.isHidden = false
            cell.lbMoTa.text = trieuchung?.MoTa
            cell.lbDauHieu.text = trieuchung?.DauHieu
            cell.lbTitle.text = trieuchung?.TenTC
            cell.imageTitle.image = #imageLiteral(resourceName: "sleeping")
        }
        heigtRow = cell.imageTitle.bounds.height + cell.lbTitle.bounds.height + cell.lbMoTa.bounds.height + cell.lbDauHieu.bounds.height + 500
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heigtRow
    }
}

extension DiagnoseViewController : DiagnoseCellDelegate {
    func diagnoseCell(maCH: String) {
        let newVC = Diagnose2ViewController.newVC(storyBoard: self.storyboard!)
        newVC.MaCHDT = maCH
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
