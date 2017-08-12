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
    var listMenu = [TRIEUCHUNG]()
    var listMenu1 = [TRIEUCHUNG]()
    var listMenu2 = [TRIEUCHUNG]()
    var listMenu3 = [TRIEUCHUNG]()
    var listmenu = [NOIDUNG]()
    var listND1 = [NOIDUNG]()
    var listND4 = [NOIDUNG]()
    var listND5 = [NOIDUNG]()
    var listND6 = [NOIDUNG]()
    var listND7 = [NOIDUNG]()
    var listND8 = [NOIDUNG]()
    var listND9 = [NOIDUNG]()
    var listND2 = [NOIDUNG]()
    var listND3 = [NOIDUNG]()
    var listND10 = [NOIDUNG]()
    var listND11 = [NOIDUNG]()
    var listND12 = [NOIDUNG]()
    var listND13 = [NOIDUNG]()
    var nameBenh = [String]()
    var numberSection = [String]()
    var index = 0
    var nameTC = [TRIEUCHUNG]()
    var nameND = [NOIDUNG]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationItem.backBarButtonItem?.title = ""
        title = "Danh Sách"
        // Do any additional setup after loading the view.
        MenuTableViewCell.registerWith(tblView: tbvMenu)
        //loadMenu()
        setupTable()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //let list = realm.objects(Sheet1.self)
        searchBenh.sizeToFit()
        //navigationItem.titleView = searchBenh
        searchBenh.delegate = self
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
        listMenu = TrieuChungBaseDataStore.shared.getAllData()
        listMenu1.removeAll()
        listMenu2.removeAll()
        listMenu3.removeAll()
        nameBenh.removeAll()
        for item in listMenu {
            nameBenh.append(item.TenTC)
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
        listmenu = NoiDungDataStore.shared.getAllData()
        listND1.removeAll()
        listND2.removeAll()
        listND3.removeAll()
        listND4.removeAll()
        listND5.removeAll()
        listND6.removeAll()
        listND7.removeAll()
        listND8.removeAll()
        listND9.removeAll()
        listND10.removeAll()
        listND11.removeAll()
        listND12.removeAll()
        listND13.removeAll()
        nameBenh.removeAll()
        if index == 3 {
            for item in listmenu {
                nameBenh.append(item.TenND)
                if item.Chuong == "4" {
                    listND1.append(item)
                }
            }
        } else if index == 2 {
            for item in listmenu {
                nameBenh.append(item.TenND)
                if item.Chuong == "3" {
                    if item.Phan == "1" {
                        listND1.append(item)
                    } else if item.Phan == "2" {
                        listND2.append(item)
                    } else if item.Phan == "3" {
                        listND3.append(item)
                    } else if item.Phan == "4"{
                        listND4.append(item)
                    } else if item.Phan == "5" {
                        listND5.append(item)
                    }else if item.Phan == "6" {
                        listND6.append(item)
                    }else if item.Phan == "7" {
                        listND7.append(item)
                    }else if item.Phan == "8" {
                        listND8.append(item)
                    }else if item.Phan == "9" {
                        listND9.append(item)
                    }else if item.Phan == "10" {
                        listND10.append(item)
                    }else if item.Phan == "11" {
                        listND11.append(item)
                    }else if item.Phan == "12" {
                        listND12.append(item)
                    } else {
                        listND13.append(item)
                    }
                }
            }
        } else {
            for item in listmenu {
                nameBenh.append(item.TenND)
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
        if searchBenh.text?.characters.count == 0 {
            if numberSection.count == 0 {
                return 1
            } else {
                return numberSection.count
            }
        }else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBenh.text?.characters.count == 0 {
      if index == 1 {
            switch section {
            case 0:
                return listMenu1.count
            case 1:
                return listMenu2.count
            default:
                return listMenu3.count
            }
      } else if index == 2 {
        switch section {
        case 0:
            return listND1.count
        case 1:
            return listND2.count
        case 2:
            return listND3.count
        case 3:
            return listND4.count
        case 4:
            return listND5.count
        case 5:
            return listND6.count
        case 6:
            return listND7.count
        case 7:
            return listND8.count
        case 8:
            return listND9.count
        case 9:
            return listND10.count
        case 10:
            return listND11.count
        case 11:
            return listND12.count
        default:
            return listND13.count
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
        }else {
            if index == 1 {
                return nameTC.count
            } else {
                return nameND.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
         if searchBenh.text?.characters.count == 0 {
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
        }else if index == 2 {
            switch indexPath.section {
            case 0:
                cell.titleMenu.text =  listND1[indexPath.row].TenND
            case 1:
                cell.titleMenu.text =  listND2[indexPath.row].TenND
            case 2:
                cell.titleMenu.text =  listND3[indexPath.row].TenND
            case 3:
                cell.titleMenu.text =  listND4[indexPath.row].TenND
            case 4:
                cell.titleMenu.text =  listND5[indexPath.row].TenND
            case 5:
                cell.titleMenu.text =  listND6[indexPath.row].TenND
            case 6:
                cell.titleMenu.text =  listND7[indexPath.row].TenND
            case 7:
                cell.titleMenu.text =  listND8[indexPath.row].TenND
            case 8:
                cell.titleMenu.text =  listND9[indexPath.row].TenND
            case 9:
                cell.titleMenu.text =  listND10[indexPath.row].TenND
            case 10:
                cell.titleMenu.text =  listND11[indexPath.row].TenND
            case 11:
                cell.titleMenu.text =  listND12[indexPath.row].TenND
            default:
                cell.titleMenu.text =  listND13[indexPath.row].TenND
            }
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
         } else {
            if index == 1 {
                cell.titleMenu!.text = nameTC[indexPath.row].TenTC
            } else {
                cell.titleMenu!.text = nameND[indexPath.row].TenND
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBenh.text?.characters.count == 0 {
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
        }else if index == 2 {
            let newVC = ReadDataPDF.newVC(storyBoard: self.storyboard!)
            switch indexPath.section {
            case 0:
                newVC.nameFilePDF = listND1[indexPath.row].UrlPDF
            case 1:
                newVC.nameFilePDF = listND2[indexPath.row].UrlPDF
            case 2:
                newVC.nameFilePDF = listND3[indexPath.row].UrlPDF
            case 3:
                newVC.nameFilePDF = listND4[indexPath.row].UrlPDF
            case 4:
                newVC.nameFilePDF = listND5[indexPath.row].UrlPDF
            case 5:
                newVC.nameFilePDF = listND6[indexPath.row].UrlPDF
            case 6:
                newVC.nameFilePDF = listND7[indexPath.row].UrlPDF
            case 7:
                newVC.nameFilePDF = listND8[indexPath.row].UrlPDF
            case 8:
                newVC.nameFilePDF = listND9[indexPath.row].UrlPDF
            case 9:
                newVC.nameFilePDF = listND10[indexPath.row].UrlPDF
            case 10:
                newVC.nameFilePDF = listND11[indexPath.row].UrlPDF
            case 11:
                newVC.nameFilePDF = listND12[indexPath.row].UrlPDF
            default:
                newVC.nameFilePDF = listND13[indexPath.row].UrlPDF
            }
            self.navigationController?.pushViewController(newVC, animated: true)
        }else {
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
        } else {
            if index == 1 {
                let newVC = DiagnoseViewController.newVC(storyBoard: self.storyboard!)
                newVC.trieuchung = nameTC[indexPath.row]
                self.navigationController?.pushViewController(newVC, animated: true)
            } else {
                let newVC = ReadDataPDF.newVC(storyBoard: self.storyboard!)
                newVC.nameFilePDF = nameND[indexPath.row].UrlPDF
                self.navigationController?.pushViewController(newVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if searchBenh.text?.characters.count == 0 {
        if numberSection.count == 0 {
            return 0
        } else {
            return 30
        }
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchBenh.text?.characters.count == 0 {
            return numberSection[section]
        } else {
            return ""
        }
    }
}

extension MenuController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filter = self.nameBenh.filter({ (text) -> Bool in
            let tmp : NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        nameTC.removeAll()
        nameND.removeAll()
        if (searchBenh.text?.characters.count)! > 0 {
        if filter.count > 0 {
            if index == 1 {
                for i in listMenu {
                    for j in filter {
                        if i.TenTC == j {
                            nameTC.append(i)
                        }
                    }
                }
            } else {
                for i in listmenu {
                    for j in filter {
                        if i.TenND == j {
                            nameND.append(i)
                        }
                    }
                }
            }
        } else {
            nameTC = []
            nameND = []
            }
        }else {
            if self.index == 1 {
                self.loadMenu()
            }else{
                self.loadChuong()
            }
        }
        
        self.tbvMenu.reloadData()
    }
}
