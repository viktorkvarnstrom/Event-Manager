//
//  Event.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-02.
//

import Foundation
import FirebaseFirestoreSwift

struct Event: Identifiable, Codable {
    @DocumentID var id: String? // = UUID().uuidString
    var title: String
    var location: String
    var category: String
    var description: String
    var imageUrl: String
    var date: String
    var daysLeft: String?
    var latitude: Double
    var longitude: Double
    var exactLocation: String?
    var isSaved: Bool
    var userId: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case location
        case category
        case date
        case description
        case imageUrl
        case latitude
        case longitude
       // case daysLeft
       // case exactLocation
        case isSaved
        case userId
    }
}
