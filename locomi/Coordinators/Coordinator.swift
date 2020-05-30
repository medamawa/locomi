//
//  Coordinator.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SwiftUI

final class Coordinator: NSObject, MKMapViewDelegate {
    
    var parent: MapView
    
    init(_ parent: MapView) {
        
        self.parent = parent
        
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            
            if let annotation = annotationView.annotation {
                
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)

                }
                
            }
            
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
                
        // ユーザーの位置情報の青い丸がピンに置き換わるのを防ぐ
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
        
        guard let markerAnnotationView = annotationView as? MKMarkerAnnotationView,
            let annotation = annotation as? ComicAnnotation else { return annotationView }
        markerAnnotationView.canShowCallout = true
        markerAnnotationView.rightCalloutAccessoryView = UIButton(type: UIButton.ButtonType.detailDisclosure)
        markerAnnotationView.clusteringIdentifier = annotation.clusteringIdentifier
        markerAnnotationView.markerTintColor = annotation.markerTintColor
        markerAnnotationView.glyphImage = UIImage(systemName: "person.circle")
        
        return markerAnnotationView
        
    }
    
    // ボタンを押された時の処理
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let comic = view.annotation else { return }
        parent.selectedComic = comic
        parent.showingComicDetail = true
        
    }
    
}
