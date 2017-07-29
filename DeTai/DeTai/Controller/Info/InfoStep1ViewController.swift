//
//  InfoStep1ViewController.swift
//  DeTai
//
//  Created by FunTap on 6/13/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class InfoStep1ViewController: UIViewController {

    @IBOutlet weak var tbvInfo1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvInfo1.delegate = self
        tbvInfo1.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InfoStep1ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tbvInfo1.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as! InfoStep1CellTableViewCell
        cell.lbInfoStep1.text = "HongNhung"
        return cell
    }
}
