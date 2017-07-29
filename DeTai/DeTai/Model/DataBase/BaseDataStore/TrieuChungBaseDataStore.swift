//
//  TrieuChungBaseDataStore.swift
//  DeTai
//
//  Created by Nhung on 7/27/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class TrieuChungBaseDataStore : NSObject
{
    
    static let shared = TrieuChungBaseDataStore() //Singeton
    let realm = try! Realm()
    var TrieuChung = [TRIEUCHUNG]()
    
    func getAllData() -> [TRIEUCHUNG]
    {
        self.TrieuChung.removeAll()
        let TrieuChung = realm.objects(TRIEUCHUNG.self)
        for item in TrieuChung {
            self.TrieuChung.append(item)
        }
        
        return self.TrieuChung
    }
    
    func saveObject(SheetObject s: TRIEUCHUNG) //em muon truyen cai gi thi phai viet them vao day, tu custom nhe
    {
        try! realm.write {
            realm.add(s) // Add object vao Data base, bang Sheet 1
        }
    }
    
    
}
