//
//  LoginViewController.swift
//  DeTai
//
//  Created by Long Nguyen on 7/16/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseDatabase
import FBSDKCoreKit
import FBSDKLoginKit
class LoginViewController: UIViewController, GIDSignInUIDelegate,GIDSignInDelegate{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginFB: UIButton!
    @IBOutlet weak var loginGG: UIButton!
    @IBOutlet weak var resetPasswordButton: UIButton!
    let signinGG = GIDSignIn()
    var databaseRef: FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        loginButton.layer.cornerRadius = 5.0
        registerButton.layer.cornerRadius = 5.0
        passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func onLogin(_ sender: UIButton) {
        loginFireBase()
    }
    @IBAction func onloginFB(_ sender: UIButton) {
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
        loginFaceBook()
    }
    @IBAction func onloginGG(_ sender: UIButton) {
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn();
    }
    @IBAction func onRegisterPage(_ sender: Any) {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "IDRegisterViewController") as! UpdateInfoPSNViewController
        self.present(myVC, animated: true, completion: nil)
    }
  
    func loginFaceBook() {
        print("User signed into facebook")
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["public_profile","email"], from: self) { (resulst, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            guard let accessToken = FBSDKAccessToken.current()
                else {
                    print("Failed to get access token")
                    return
            }
            print("token\(accessToken)")
            let crendential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            FIRAuth.auth()?.signIn(with: crendential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }else{
                    self.databaseRef = FIRDatabase.database().reference()
                    self.databaseRef.child("user_profiles").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                        let snapshot = snapshot.value as? NSDictionary
                        if(snapshot == nil)
                        {
                            self.databaseRef.child("user_profiles").child("user").child(user!.uid).child("name").setValue(user?.displayName)
                            self.databaseRef.child("user_profiles").child("user").child(user!.uid).child("email").setValue(user?.email)
                        }
                    })
                    let myVC = self.storyboard?.instantiateViewController(withIdentifier: "IDRootViewController") as! RootViewController
                    print("Login success!")
                    self.present(myVC, animated: true, completion: nil)
                }
            })
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        print("User signed into google")
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,accessToken: (authentication?.accessToken)!)
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            print("User Signed Into Firebase")
            
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
            }else{
                self.databaseRef = FIRDatabase.database().reference()
                self.databaseRef.child("user_profiles").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    let snapshot = snapshot.value as? NSDictionary
                    
                    if(snapshot == nil)
                    {
                        self.databaseRef.child("user_profiles").child("user").child(user!.uid).child("name").setValue(user?.displayName)
                        self.databaseRef.child("user_profiles").child("user").child(user!.uid).child("email").setValue(user?.email)
                    }
                    let myVC = self.storyboard?.instantiateViewController(withIdentifier: "IDRootViewController") as! RootViewController
                    print("Login success!")
                    self.present(myVC, animated: true, completion: nil)
                })
                
            }
        }
    }
    
    func loginFireBase() {
        if emailTextField.text == "" && passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Login Error", message:"Email và password không được bỏ trống!\n Mời bạn xem lại thông tin!", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            self.present(alertController, animated: true, completion: nil)
        }
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (firUser, error) in
            if error != nil{
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                print("error:\(String(describing: error?.localizedDescription))")
                let alertController = UIAlertController(title: "Login Error", message: "Thông tin đăng nhập sai!\n Mời bạn kiểm tra lại!", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
            }else if let userlogin = FIRAuth.auth()?.currentUser{
                let myVC = self.storyboard?.instantiateViewController(withIdentifier: "IDRootViewController") as! RootViewController
                print("Login success!")
                self.present(myVC, animated: true, completion: nil)
            }
        })
        
    }
    
    @IBAction func onResetPassPresent(_ sender: Any) {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "IDResetPasswordViewController") as! ResetPasswordViewController
        self.present(myVC, animated: true, completion: nil)
    }
}
