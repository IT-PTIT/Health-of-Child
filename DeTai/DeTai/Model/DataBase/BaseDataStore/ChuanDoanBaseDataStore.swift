//
//  ChuanDoanBaseDataStore.swift
//  DeTai
//
//  Created by Nhung on 7/29/17.
//  Copyright © 2017 Nhung. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class ChuanDoanBaseDataStore : NSObject
{
    
    static let shared = ChuanDoanBaseDataStore() //Singeton
    let realm = try! Realm()
    var CauHoi = CAUHOI()
    var CauTraLoi = [CAUTRALOI]()
    
    func getAllData(MaCH: String) -> CAUHOI
    {
        let predicate = NSPredicate(format: "MaCH = %@", MaCH)
        let cauhoi = realm.objects(CAUHOI.self).filter(predicate)
        for item in cauhoi {
            self.CauHoi = item
        }
        return self.CauHoi
    }
    
    func getCAUTRALOI(MaCH: String) -> [CAUTRALOI] {
        self.CauTraLoi.removeAll()
        let predicate = NSPredicate(format: "MaCH = %@", MaCH)
        let cautraloi = realm.objects(CAUTRALOI.self).filter(predicate)
        for item in cautraloi {
            self.CauTraLoi.append(item)
        }
        return self.CauTraLoi
    }
    
    func saveObject(SheetObject s: CAUHOI)     {
        try! realm.write {
            realm.add(s) // Add object vao Data base, bang Sheet 1
        }
    }
    
    
}
