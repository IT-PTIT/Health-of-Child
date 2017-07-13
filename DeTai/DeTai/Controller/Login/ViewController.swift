//
//  ViewController.swift
//  DeTai
//
//  Created by Nhung on 5/14/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var imgAvata: UIImageView!
    
    @IBOutlet weak var tfLogin: UITextField!
    
    @IBOutlet weak var tfPassWord: UITextField!
    
    @IBOutlet weak var btForgotPass: UIButton!
    
    @IBOutlet weak var btLogin: UIButton!
    
    @IBOutlet weak var btRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func LoginAction(_ sender: Any) {
       // let homeViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "IDHomeViewController") as? HomeViewController
        //self.navigationController?.pushViewController(homeViewControllerObj!, animated: true)
    }
    
    @IBAction func RegisterAction(_ sender: Any) {
        let rgViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "IDRegisterViewController") as? RegisterViewController
        self.navigationController?.pushViewController(rgViewControllerObj!, animated: true)
    }
    
}

