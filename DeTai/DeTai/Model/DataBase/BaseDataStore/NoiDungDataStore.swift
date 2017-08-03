//
//  NoiDungDataStore.swift
//  DeTai
//
//  Created by Nhung on 8/3/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import Foundation
import RealmSwift

class NoiDungDataStore : NSObject
{
    
    static let shared = NoiDungDataStore() //Singeton
    let realm = try! Realm()
    var ALLND = [NOIDUNG]()
    
    func getAllData() -> [NOIDUNG]
    {
        self.ALLND.removeAll()
        let ND = realm.objects(NOIDUNG.self)
        for item in ND {
            self.ALLND.append(item)
        }
        
        return self.ALLND
    }
    
    func saveObject(SheetObject s: TRIEUCHUNG) //em muon truyen cai gi thi phai viet them vao day, tu custom nhe
    {
        try! realm.write {
            realm.add(s) // Add object vao Data base, bang Sheet 1
        }
    }
    
    
}
