//
//  MenuController.swift
//  DeTai
//
//  Created by Nhung on 7/19/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class MenuController: UIViewController {
    
    class func newVC(storyBoard:UIStoryboard) -> MenuController {
        
        let newVC = storyBoard.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        return newVC
    }
    
    @IBOutlet weak var searchBenh: UISearchBar!
    @IBOutlet weak var tbvMenu: UITableView!
    var listMenu1 = [TRIEUCHUNG]()
    var listMenu2 = [TRIEUCHUNG]()
    var listMenu3 = [TRIEUCHUNG]()
    var listND1 = [NOIDUNG]()
    var listND2 = [NOIDUNG]()
    var listND3 = [NOIDUNG]()
    var numberSection = [String]()
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Danh Sách"
        // Do any additional setup after loading the view.
        MenuTableViewCell.registerWith(tblView: tbvMenu)
        //loadMenu()
        setupTable()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //let list = realm.objects(Sheet1.self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTable() {
        self.tbvMenu.delegate = self
        self.tbvMenu.dataSource = self
    }
    
    func loadMenu() {
        var listMenu = [TRIEUCHUNG]()
        listMenu = TrieuChungBaseDataStore.shared.getAllData()
        listMenu1.removeAll()
        listMenu2.removeAll()
        listMenu3.removeAll()
        for item in listMenu {
            if item.LuaTuoi == "1" {
                listMenu1.append(item)
            } else if item.LuaTuoi == "2" {
                listMenu2.append(item)
            } else{
                listMenu3.append(item)
            }
        }
    }
    
    func loadChuong() {
        var listmenu = [NOIDUNG]()
        listmenu = NoiDungDataStore.shared.getAllData()
        listND1.removeAll()
        listND2.removeAll()
        listND3.removeAll()
        if index == 3 {
            for item in listmenu {
                if item.Chuong == "4" {
                    listND1.append(item)
                }
            }
        } else {
            for item in listmenu {
                if item.Chuong == "1" {
                    if item.Phan == "1" {
                        listND1.append(item)
                    } else if item.Phan == "2" {
                        listND2.append(item)
                    } else{
                        listND3.append(item)
                    }
                }

            }
        }
    }
}

extension MenuController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if numberSection.count == 0 {
            return 1
        } else {
            return numberSection.count
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if index == 1 {
            switch section {
            case 0:
                return listMenu1.count
            case 1:
                return listMenu2.count
            default:
                return listMenu3.count
            }
      } else if index == 3 {
            return listND1.count
      } else {
            switch section {
            case 0:
                return listND1.count
            case 1:
                return listND2.count
            default:
                return listND3.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        if index == 1 {
            switch indexPath.section {
            case 0:
                cell.titleMenu!.text = listMenu1[indexPath.row].TenTC
            case 1:
                cell.titleMenu!.text = listMenu2[indexPath.row].TenTC
            default:
                cell.titleMenu!.text = listMenu3[indexPath.row].TenTC
            }
            return cell
        } else if index == 3 {
            cell.titleMenu.text = listND1[indexPath.row].TenND
            return cell
        }else {
            switch indexPath.section {
            case 0:
                cell.titleMenu!.text = listND1[indexPath.row].TenND
            case 1:
                cell.titleMenu!.text = listND2[indexPath.row].TenND
            default:
                cell.titleMenu!.text = listND3[indexPath.row].TenND
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if index == 1 {
            let newVC = DiagnoseViewController.newVC(storyBoard: self.storyboard!)
            switch indexPath.section {
            case 0:
                newVC.trieuchung = listMenu1[indexPath.row]
            case 1:
                newVC.trieuchung = listMenu2[indexPath.row]
            default:
                newVC.trieuchung = listMenu3[indexPath.row]
            }
            self.navigationController?.pushViewController(newVC, animated: true)
        } else {
            let newVC = ReadDataPDF.newVC(storyBoard: self.storyboard!)
            if index == 3 {
                newVC.nameFilePDF = listND1[indexPath.row].UrlPDF
            } else {
                switch indexPath.section {
                case 0:
                    newVC.nameFilePDF = listND1[indexPath.row].UrlPDF
                case 1:
                    newVC.nameFilePDF = listND2[indexPath.row].UrlPDF
                default:
                    newVC.nameFilePDF = listND3[indexPath.row].UrlPDF
                }
            }
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if numberSection.count == 0 {
            return 0
        } else {
            return 30
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return numberSection[section]
    }
}
