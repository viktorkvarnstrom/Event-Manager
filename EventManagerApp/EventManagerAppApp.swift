//
//  EventManagerAppApp.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-01.
//

import SwiftUI
import Firebase

@main
struct EventManagerAppApp: App {
    @StateObject var viewModel = EventsViewModel()
 
    init() {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Hem")
                }.environmentObject(viewModel)
                NavigationView {
                    EventMapView()
                        .edgesIgnoringSafeArea(.all)
                }
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Karta")
                }
                NavigationView {
                    SavedEventsView()
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Sparade")
                }.environmentObject(viewModel)
            }
        }
    }
}
