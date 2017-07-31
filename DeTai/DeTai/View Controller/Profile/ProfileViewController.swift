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
import FirebaseDatabase
class ProfileViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var changeImageButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UIView!
    @IBOutlet weak var numberphoneLabel: UILabel!
    @IBOutlet weak var updateInfoPSNButton: UIButton!
    
    let databaseRef = FIRDatabase.database().reference()
    var userJSON = [user_profile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = RootTab.profileTab.title
        loadData()
            }
    override func viewDidAppear(_ animated: Bool) {
        updateInfoPSNButton.layer.cornerRadius = 5.0
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2.0
        profileImage.clipsToBounds = true
    }
    @IBAction func onLogout(_ sender: Any) {
        if GIDSignIn.sharedInstance().hasAuthInKeychain() == true {
            GIDSignIn.sharedInstance().signOut()
            print("Logout success")
                dismiss(animated: true, completion: nil)
        }else if FBSDKAccessToken.current() != nil || FIRAuth.auth()?.currentUser != nil{
           try! FIRAuth.auth()?.signOut()
                dismiss(animated: true, completion: nil)
            print("Logout success")
        }

    }
    @IBAction func onUpdateInfor(_ sender: Any) {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "IDUpdateInfoPSNViewController") as! UpdateInfoPSNViewController
        self.present(myVC, animated: true, completion: nil)
    }

    @IBAction func onChange(_ sender: Any) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.allowsEditing = true
        imgPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imgPicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImgfromPicker: UIImage?
        if let edittedImg = info[UIImagePickerControllerEditedImage] as? UIImage{
            selectedImgfromPicker = edittedImg
        }
        else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            selectedImgfromPicker = originalImage
        }
        if let selectedImg = selectedImgfromPicker{
            profileImage.image = selectedImg
            dismiss(animated: true, completion: nil)
        }
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func saveChange(){
    
    }
    func loadData(){
        let uid = FIRAuth.auth()?.currentUser?.uid
        databaseRef.child("user_profiles").child("user").child(uid!).observeSingleEvent(of: .childAdded, with: { (snapshot) in
            if let userdataJSON = snapshot.value as? [String:Any]{
                for item in userdataJSON{
                    self.userJSON.append(<#T##newElement: user_profile##user_profile#>)
                }
            }
        })
    }
}
