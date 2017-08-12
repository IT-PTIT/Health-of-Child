//
//  TGQViewController.swift
//  DeTai
//
//  Created by Nhung on 7/30/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class TGQViewController: UIViewController {
    
    class func newVC(storyBoard:UIStoryboard) -> TGQViewController {
        
        let newVC = storyBoard.instantiateViewController(withIdentifier: "TGQViewController") as! TGQViewController
        return newVC
    }

    @IBOutlet weak var tbvTGQ: UITableView!
    var tgq = TUGIAIQUYET()
    var heigth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem?.title = ""
        TGQTableViewCell.registerWith(tblView: tbvTGQ)
        title = tgq.TenTGQ
        tbvTGQ.delegate = self
        tbvTGQ.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TGQViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TGQTableViewCell", for: indexPath) as! TGQTableViewCell
        cell.imgTGQ.image = UIImage(named: tgq.UrlImage)
        cell.NDtgq = tgq.NDTGQ
        heigth = cell.heigtCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heigth
    }
}
