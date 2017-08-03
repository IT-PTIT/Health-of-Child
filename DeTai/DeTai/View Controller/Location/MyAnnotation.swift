//
//  searchAnnotation.swift
//  final
//
//  Created by phungducchinh on 7/31/17.
//  Copyright © 2017 phungducchinh. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title: String!
    
    init(title: String,  coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
}
