//
//  EventMapView.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-03-03.
//

import MapKit
import SwiftUI

struct EventMapView: View {
    @EnvironmentObject var locations: EventsViewModel
    @ObservedObject private var viewModel = EventsViewModel()
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 59.27337, longitude: 16.20118),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: viewModel.events) { event in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude)) {
                NavigationLink(destination: EventView(event: event)) {
                Image(systemName: "star.fill")
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 20, height: 20)
                    .shadow(radius: 3)
                }
            }
        }
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}


struct EventMapView_Previews: PreviewProvider {
    static var previews: some View {
        EventMapView()
    }
}
