//
//  ComicAnnotation.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import MapKit
import UIKit

final class ComicAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let markerTintColor: UIColor
    var clusteringIdentifier : String
    
    init(Comic: Comic) {
        
        self.title = Comic.text
        self.subtitle = Comic.id
        self.coordinate = CLLocationCoordinate2DMake(Comic.lat, Comic.lng)
        self.markerTintColor = .black
        self.clusteringIdentifier = "sample"
        
    }
    
}
