//
//  TestItem.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-02.
//

import Foundation
import FirebaseFirestoreSwift

struct TestItem : Codable, Identifiable {
    @DocumentID var id : String?
    var name : String
    var done : Bool = false
}
