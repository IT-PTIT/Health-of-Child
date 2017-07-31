//
//  User.swift
//  DeTai
//
//  Created by HieuNT on 7/30/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import Foundation
class user_profile{
   var username: String?
    var nickname: String?
    var email: String?
    var birthday: Date?
    var numberphone:String?
    var password: String?
    var imgprofile: String?
    
    
    init?(jsonDATA:[String:Any]) {
        guard let username = jsonDATA["name"] as? String else {return nil}
        guard let nickname = jsonDATA["nickname"] as? String else {return nil}
        guard let email = jsonDATA["email"] as? String else {return nil}
        guard let birthday = jsonDATA["birthday"] as? Date else {return nil}
        guard let numberphone = jsonDATA["numberphone"] as? String else {return nil}
        guard let password = jsonDATA["password"] as? String else {return nil}
        guard let imgprofile = jsonDATA["imgprofile"] as? String else {return nil}
        self.username = username
        self.nickname = nickname
        self.email = email
        self.birthday = birthday
        self.numberphone = numberphone
        self.password = password
        self.imgprofile = imgprofile
    }
    
}
