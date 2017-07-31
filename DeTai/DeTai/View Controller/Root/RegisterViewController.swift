//
//  RegisterViewController.swift
//  DeTai
//
//  Created by HieuNT on 7/17/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //add database
    var databaseRef: FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        registerButton.layer.cornerRadius = 5.0
        cancelButton.layer.cornerRadius = 5.0
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func onRegister(_ sender: UIButton) {
        if usernameTextField.text == "" && mailTextField.text == "" && phoneTextField.text == "" && passwordTextField.text == "" && phoneTextField.text == "" {
            let alertController = UIAlertController(title: "Register Error", message: "Bạn cần điền đầy đủ thông tin!", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            self.present(alertController, animated: true, completion: nil)
        }
        FIRAuth.auth()?.createUser(withEmail: mailTextField.text!, password: passwordTextField.text!, completion: { (firUser, error) in
            if error == nil{
                self.databaseRef = FIRDatabase.database().reference()
                self.databaseRef.child("user_profiles").child((firUser?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                    let snapshot = snapshot.value as? NSDictionary
                    if(snapshot == nil){
                        self.databaseRef.child("user_profiles").child("user").child((firUser?.uid)!).child("name").setValue(self.usernameTextField.text)
                        self.databaseRef.child("user_profiles").child("user").child((firUser?.uid)!).child("email").setValue(self.mailTextField.text)
                        self.databaseRef.child("user_profiles").child("user").child((firUser?.uid)!).child("phone").setValue(self.phoneTextField.text)
                        self.databaseRef.child("user_profiles").child("user").child((firUser?.uid)!).child("password").setValue(self.passwordTextField.text)
                    }

                })
               self.dismiss(animated: true, completion: nil)
            }else
            {
                print("error:\(String(describing: error?.localizedDescription))")
            }
        })
    }
    @IBAction func onCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
}
