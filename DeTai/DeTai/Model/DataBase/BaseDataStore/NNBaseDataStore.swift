//
//  NNBaseDataStore.swift
//  DeTai
//
//  Created by Nhung on 7/30/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class NNBaseDataStore : NSObject
{
    
    static let shared = NNBaseDataStore() //Singeton
    let realm = try! Realm()
    var NN = NGUYENNHAN()
    
    func getAllData(MaNN: String) -> NGUYENNHAN
    {
        let predicate = NSPredicate(format: "MaNN = %@", MaNN)
        let nn = realm.objects(NGUYENNHAN.self).filter(predicate)
        for item in nn {
            self.NN = item
        }
        return self.NN
    }
    
    func saveObject(SheetObject s: NGUYENNHAN)     {
        try! realm.write {
            realm.add(s) // Add object vao Data base, bang Sheet 1
        }
    }
    
    
}
