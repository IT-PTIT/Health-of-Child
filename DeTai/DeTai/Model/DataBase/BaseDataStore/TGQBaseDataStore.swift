//
//  TGQBaseDataStore.swift
//  DeTai
//
//  Created by Nhung on 7/30/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class TGQBaseDataStore : NSObject
{
    
    static let shared = TGQBaseDataStore() //Singeton
    let realm = try! Realm()
    var TGQ = [TUGIAIQUYET]()
    
    func getAllData(MaNN: String) -> [TUGIAIQUYET]
    {
        TGQ.removeAll()
        let predicate = NSPredicate(format: "MaNN = %@", MaNN)
        let nn = realm.objects(NN_TGQ.self).filter(predicate)
        for item in nn {
            let predicate = NSPredicate(format: "MaTGQ = %@", item.MaTGQ)
            let tgq = realm.objects(TUGIAIQUYET.self).filter(predicate)
            for i in tgq {
                self.TGQ.append(i)
            }
        }
        return self.TGQ
    }
    
    func saveObject(SheetObject s: TUGIAIQUYET)     {
        try! realm.write {
            realm.add(s) // Add object vao Data base, bang Sheet 1
        }
    }
    
    
}
