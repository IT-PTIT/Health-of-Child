//
//  RegisterViewController.swift
//  DeTai
//
//  Created by FunTap on 6/12/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var btAddAva: UIButton!
    @IBOutlet weak var imgAvata: UIImageView!
    @IBOutlet weak var tfRGUser: UITextField!
    @IBOutlet weak var tfRGPass: UITextField!
    @IBOutlet weak var btRgCancel: UIButton!
    @IBOutlet weak var btRgRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RGRegisterAction(_ sender: Any) {
    }

    @IBAction func RGCancel(_ sender: Any) {
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
