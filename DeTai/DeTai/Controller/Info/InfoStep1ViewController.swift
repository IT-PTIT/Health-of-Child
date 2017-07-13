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
    
    var nameOfTitle = ""
    var numberOfbutton : Int!
    
    var labelcothehoc = ["Những hệ thống cơ thể của trẻ"]
    var detailcothehoc = ["Những hệ thống cơ thể của trẻ hoạt động"]
    var chitiettrieuchung = ["Sốt ở trẻ sơ sinh và em bé", "Bệnh tiêu chảy ở em bé"]
    var detailtrieuchung = ["Sốt là hình thức gia tăng nhiệt độ", "Tiêu chảy là hình thức phân lỏng ở trẻ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvInfo1.delegate = self
        tbvInfo1.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.leftBarButtonItem?.title = "BACK"
        self.navigationItem.title = nameOfTitle
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if (numberOfbutton == 1 ) {return labelcothehoc.count}
            else if (numberOfbutton == 2 ) {return chitiettrieuchung.count}
            else {return 0}
//        case 2:
//            if (numberOfbutton == 1 ) {return 1}
//            else if (numberOfbutton == 2 ) {return 1}
//            else {return 0}
//        case 4:
//            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            if (numberOfbutton == 1 ) {return "Cơ thể học và sự phát triển của trẻ"}
            else if (numberOfbutton == 2 ) {return "Trẻ em dưới 1 tuổi"}
            else {return "Name of label"}
        case 1:
            return "Xem thêm"
        case 2:
            if (numberOfbutton == 1 ) {return "Sống khoẻ mạnh"}
            else if (numberOfbutton == 2 ) {return "Trẻ em trên 1 tuổi"}
            else {return "Name of label"}
        case 3:
            return "Xem thêm"
        case 4:
            if (numberOfbutton == 1 ) {return "Những vấn đề ở em bé"}
            else if (numberOfbutton == 2 ) {return "Trẻ em trên mọi lứa tuổi"}
            else {return "Name of label"}
        case 5:
            return "Xem thêm"
        default: return ""
        }
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvInfo1.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as! InfoStep1CellTableViewCell
        switch indexPath.section {
        case 0:
            if (numberOfbutton == 1 ) {
                cell.lbInfoStep1.text = labelcothehoc[indexPath.row]
                cell.lbInfoStep1.sizeToFit()
                cell.lbldetail.text = detailcothehoc[indexPath.row]
                cell.lbldetail.sizeToFit()
                cell.imgStep1.image = UIImage(named: "baby-crying-icon")
            }
            else if (numberOfbutton == 2 ) {
                cell.lbInfoStep1.text = chitiettrieuchung[indexPath.row]
                cell.lbInfoStep1.sizeToFit()
                cell.lbldetail.text = detailtrieuchung[indexPath.row]
                cell.lbldetail.sizeToFit()
                cell.imgStep1.image = UIImage(named: "baby")
            }
            else { cell.lbInfoStep1.text = "HongNhung"}
            return cell
//        case 1:
//            cell.lbInfoStep1.text = "HongNhung"
            //return cell
//        case 2:
//            if (numberOfbutton == 1 ) {cell.lbInfoStep1.text = "HongNhung"}
//            else if (numberOfbutton == 2 ) {cell.lbInfoStep1.text = "HongNhung"}
//            else { "Name of label"}
//            return cell
//        case 3:
//            return cell
//        case 4:
//            if (numberOfbutton == 1 ) {return "Những vấn đề ở em bé"}
//            else if (numberOfbutton == 2 ) {return "Trẻ em trên mọi lứa tuổi"}
//            else {return "Name of label"}
//                return cell
//        case 5:
//            return "Xem thêm"
            //return cell
        default: return cell
        }
        
        
       return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tbvInfo1.dequeueReusableCell(withIdentifier: "Seemorecell", for: indexPath) as! InfoStep1CellTableViewCell
        switch indexPath.section {
        case 1:
            tableView.reloadData()
        case 3:
            tableView.reloadData()
        case 5:
            tableView.reloadData()
        default : break
        }
    }
}
