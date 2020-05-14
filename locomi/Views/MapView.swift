//
//  MapView.swift
//  locomi
//
//  Created by sogo on 2020/04/27.
//  Copyright © 2020 Sogo Nishihara. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var selectedComic: MKAnnotation?
    @Binding var showingComicDetail: Bool
    let comics: [Comic]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        updateAnnotations(from: uiView)
        
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        
        mapView.removeAnnotations(mapView.annotations)
        print("remove annotations")
        let annotations = self.comics.map(ComicAnnotation.init)
        mapView.addAnnotations(annotations)
        print("add annotations")
        
    }
    
}
