//
//  ResetPasswordViewController.swift
//  DeTai
//
//  Created by HieuNT on 7/30/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import FirebaseDatabase
class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewDidAppear(_ animated: Bool) {
        resetPasswordButton.layer.cornerRadius = 5.0
        cancelButton.layer.cornerRadius = 5.0
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onResetPassword(_ sender: Any) {
        let email = emailTextField.text
        SVProgressHUD.show(withStatus: "Please, wait...")
        SVProgressHUD.setDefaultMaskType(.gradient)
        if emailTextField.text == ""{
            let alertController = UIAlertController(title: "Reset Error", message: "Vui lòng nhập lại email bạn đã đăng ký.", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        FIRAuth.auth()?.sendPasswordReset(withEmail: email!, completion: { (error) in
            OperationQueue.main.addOperation {
                if error != nil {
                    // Error - Unidentified Email
                    SVProgressHUD.dismiss()
                    let alertController = UIAlertController(title: "Unidentified Email Address", message: "Vui lòng nhập lại email bạn đã đăng ký.", preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    // Success - Sends recovery email
                    SVProgressHUD.dismiss()
                    let alertController = UIAlertController(title: "Email Sent", message: "Email đã được gửi!\n Bạn vui lòng kiểm tra lại email.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alertController, animated: true, completion: nil)
                }
            }})
    }
}
