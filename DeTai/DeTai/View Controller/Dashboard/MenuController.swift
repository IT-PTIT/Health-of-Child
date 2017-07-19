//
//  MenuController.swift
//  DeTai
//
//  Created by Nhung on 7/19/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    class func newVC(storyBoard:UIStoryboard) -> MenuController {
        
        let newVC = storyBoard.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        return newVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Danh Sách"
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
