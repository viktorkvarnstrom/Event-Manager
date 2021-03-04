//
//  EventsViewModel.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-02.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI
import Combine


class EventsViewModel: ObservableObject {
    @Published var events = [Event]()
    @Published var isFavorite: Bool = false
    private var db = Firestore.firestore()
    
    func addEventToFavorites(event: Event) {
        // let eventID = event.id
        
        do {
            var savedFavorite = event
           // var boolIsSaved = event
           // boolIsSaved.isSaved = true
            savedFavorite.isSaved = true
            savedFavorite.userId = Auth.auth().currentUser?.uid
           let _ = try db.collection("favorites").addDocument(from: savedFavorite)
           // let _ = try db.collection("events").addDocument(from: savedFavorite)
           // let _ = try db.collection("events").document(eventID!).setData(from: boolIsSaved)
        } catch {
            print(error)
        }
    }
    
    func saveToFirestore(event: Event) {
        addEventToFavorites(event: event)
    }
    
    func deleteFavoritesFromFirestore(event: Event) {
        db.collection("favorites").document(event.id!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document remvoed")
            }
        }
    }
    
    func deleteData(event: Event) {
        deleteFavoritesFromFirestore(event: event)
    }
 

    func fetchData() {
        db.collection("events").addSnapshotListener { (querySnapshot, error ) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.events = documents.compactMap {(queryDocumentSnapshot) -> Event? in
                try? queryDocumentSnapshot.data(as: Event.self)
                
            }
        }
    }
    
    func fetchFavorites() {
        let userId = Auth.auth().currentUser?.uid
        db.collection("favorites")
            .whereField("userId", isEqualTo: userId!)
            .addSnapshotListener { (querySnapshot, error ) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.events = documents.compactMap {(queryDocumentSnapshot) -> Event? in
                try? queryDocumentSnapshot.data(as: Event.self)
                
            }
        }
    }
    
}

