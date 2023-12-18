//
//  MapView.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 16/12/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var station: Station
    @ObservedObject var viewModel: StationViewModel
    
    @State private var showingDetail = false
        
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.4374, longitude: -99.137571), // Coordenadas de Mérida, Yucatán, México
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            // El zoom máximo de momento no es suficiente en SwiftUI, se tendría que usar UIKit
        )
    
    init(station: Station, viewModel: StationViewModel) {
        self.station = station
        self.viewModel = viewModel
        _region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    
    var body: some View{
        Map(coordinateRegion: $region,
            annotationItems: [Locationn(coordinate: CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude))]) { place in
            MapAnnotation(coordinate: place.coordinate) {
                Image(systemName: "bicycle")
                    .foregroundColor(Color.red)
            }
        }.onTapGesture {
            self.showingDetail = true
        }
        .sheet(isPresented: $showingDetail) {
            StationDetailView(station: station, viewModel: viewModel, onClose: { self.showingDetail = false })
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //Text("Latitud: \(region.center.longitude), Longitud: \(region.center.longitude)")
    }
}


struct Locationn: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
