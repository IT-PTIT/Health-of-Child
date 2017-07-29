//
//  ProfileViewController.swift
//  DeTai
//
//  Created by Long Nguyen on 7/16/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKCoreKit
import Firebase
class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = RootTab.profileTab.title
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func onLogout(_ sender: Any) {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() == true {
            GIDSignIn.sharedInstance().signOut()
//            logout.isHidden = true
//            customButton.isHidden = false
//            defaultButton.isHidden = false
           // alert("Logged Out", message: "")
            print("Logout success")
            //if let storyboard = self.storyboard {
               // let vc = storyboard.instantiateViewController(withIdentifier: "IDLoginViewController") as! LoginViewController
                dismiss(animated: true, completion: nil)
            //}
          //  dismiss(animated: true, completion: nil)
        }else if FBSDKAccessToken.current() != nil || FIRAuth.auth()?.currentUser != nil{
           try! FIRAuth.auth()?.signOut()
           // if let storyboard = self.storyboard {
                //let vc = storyboard.instantiateViewController(withIdentifier: "IDLoginViewController") as! LoginViewController
                dismiss(animated: true, completion: nil)
            print("Logout success")
            //}
        }

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
