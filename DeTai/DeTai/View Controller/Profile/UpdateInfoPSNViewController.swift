//
//  UpdateInfoPSNViewController.swift
//  DeTai
//
//  Created by Lon on 8/3/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import Firebase

class UpdateInfoPSNViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var numberphoneTextField: UITextField!
    @IBOutlet weak var saveInfoButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let databaseRef = FIRDatabase.database().reference()
    let uid = FIRAuth.auth()?.currentUser?.uid
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        saveInfoButton.layer.cornerRadius = 5.0
        cancelButton.layer.cornerRadius = 5.0
        
    }
    func loadData(){
        
        databaseRef.child("user_profiles").child("user").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            if let userdataJSON = snapshot.value as? [String:Any]{
                self.usernameTextField.text = userdataJSON["name"] as? String
                self.emailTextField.text = userdataJSON["email"] as? String
                self.nicknameTextField.text = userdataJSON["nickname"] as? String
                self.numberphoneTextField.text = userdataJSON["phone"] as? String
                self.birthdayTextField.text = userdataJSON["birthday"] as? String
                
            }
        })
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func onSave(_ sender: Any) {
        
        let value = ["name": usernameTextField.text,"email":emailTextField.text,"nickname":nicknameTextField.text,"phone":numberphoneTextField.text,"birthday":birthdayTextField.text]
        self.databaseRef.child("user_profiles").child("user").child(self.uid!).updateChildValues(value) { (error, dataref) in
            if error != nil {
                print(error?.localizedDescription)
                let alertController = UIAlertController(title: "Register Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }else{
                print("update success")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
