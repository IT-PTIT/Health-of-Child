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
    var heigtRow: CGFloat? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        NguyenNhan = NNBaseDataStore.shared.getAllData(MaNN: MaNN)
    }
    
}

extension CauseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CauseViewCell", for: indexPath) as! CauseViewCell
        cell.lbNDNN.text = NguyenNhan.NDNN
        cell.lbYte.text = NguyenNhan.NDHD
        cell.lbNDTGQ.text = NguyenNhan.TGQ
        heigtRow = cell.heigthCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}
