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
    var ALLTrieuChung = [TRIEUCHUNG]()
    var TrieuChung = TRIEUCHUNG()
    
    func getAllData() -> [TRIEUCHUNG]
    {
        self.ALLTrieuChung.removeAll()
        let TrieuChung = realm.objects(TRIEUCHUNG.self)
        for item in TrieuChung {
            self.ALLTrieuChung.append(item)
        }
        
        return self.ALLTrieuChung
    }
    
    func getTrieuChung(MaTC: String) -> TRIEUCHUNG {
        let predicate = NSPredicate(format: "MaTC = %@", MaTC)
        let cauhoi = realm.objects(TRIEUCHUNG.self).filter(predicate)
        for item in cauhoi {
            self.TrieuChung = item
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
