//
//  KQArlert.swift
//  DeTai
//
//  Created by Nhung on 8/12/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class KQArlert: UIViewController {
    
    static let identifier = "KQArlert"
    
    class func newVC(storyBoard:UIStoryboard) -> KQArlert {
        
        let newVC = storyBoard.instantiateViewController(withIdentifier: KQArlert.identifier) as! KQArlert
        return newVC
    }
    
    @IBOutlet weak var ndKQ: UILabel!
    
    var NguyenNhan = NGUYENNHAN()
    var KQ: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ndKQ.text = KQ
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(MaNN: String) {
        NguyenNhan = NNBaseDataStore.shared.getAllData(MaNN: MaNN)
        KQ = NguyenNhan.NDNN
    }

    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    
    @IBAction func OK(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "IDRootViewController") as! RootViewController
        controller.selectedIndex = 2
        self.present(controller, animated: true, completion: nil)
        
        
//        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "IDRootViewController") as! RootViewController
        print("Login success!")
//        controller.selectedIndex = 2
//        self.present(controller, animated: true, completion: nil)
//        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
//        let homeVC = storyboard.instantiateInitialViewController() as! UINavigationController
//        self.present(homeVC, animated: true, completion: nil)
    }
    
}
