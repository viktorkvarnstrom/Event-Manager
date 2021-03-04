//
//  ContentView.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-01.
//

import SwiftUI

struct ContentView: View {
    @State private var eventsSearch: String = "Håkan Hellström"
    @State private var location: String = ""

    
    var body: some View {
       // NavigationView {
        ScrollView {
                VStack(alignment: .leading){
                    Text("Plats")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    HStack {
                        TextField("Alla platser", text: $location)
                        Image(systemName: "location.north")
                    }
                    .padding()
                    .background(Color("back"))
                    .cornerRadius(10)
                }
                .padding(.bottom, 30)
                Text("Sport")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(width: 360, height: 20, alignment: .leading)
                HStack(spacing: 25) {
                    NavigationLink(destination: EventListView(choice: "Padel", location: location)) {
                        ExtractedView(name: "Padel", image: "padel")
                    }
                    NavigationLink(destination: EventListView(choice: "Hockey", location: location)) {
                        ExtractedView(name: "Hockey", image: "hockey")
                    }
                }
                .padding(.bottom, 10)
                HStack(spacing: 25) {
                    NavigationLink(destination: EventListView(choice: "Fotboll", location: location)) {
                        ExtractedView(name: "Fotboll", image: "fotboll")
                    }
                    NavigationLink(destination: EventListView(choice: "Handboll", location: location)) {
                        ExtractedView(name: "Handboll", image: "handboll1")
                    }
                }
                .padding(.bottom, 10)
                Text("Musik")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 20, alignment: .leading)
                HStack(spacing: 25) {
                    NavigationLink(destination: EventListView(choice: "Konsert", location: location)) {
                        ExtractedView(name: "Konserter", image: "konsert")
                    }
                    NavigationLink(destination: EventListView(choice: "Trubadur", location: location)) {
                        ExtractedView(name: "Trubadur", image: "trubadur")
                    }
                }
                .padding(.bottom, 10)
                Text("Mat & Dryck")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(width: 360, height: 20, alignment: .leading)
                HStack(spacing: 25) {
                    NavigationLink(destination: EventListView(choice: "Mat", location: location)) {
                        ExtractedView(name: "Mat", image: "matfestival")
                    }
                    NavigationLink(destination: EventListView(choice: "Dryck", location: location)) {
                        ExtractedView(name: "Dryck", image: "vin")
                    }
                }
                .padding(.bottom, 25)
            
                NavigationLink(destination: EventListView(choice: "All", location: location)) {
                    Text("Visa alla event")
                }
               .padding(.bottom, 100)
                Spacer()
        }
            .padding(.horizontal)
            .padding(.top, 50)
            .ignoresSafeArea()
    }
}

 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





struct ExtractedView: View {
    var name : String
    public var image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .cornerRadius(5)
                .aspectRatio(contentMode: .fill)
                .font(.system(size: 34))
                .foregroundColor(.primary)
                .opacity(0.9)
                .frame(width: 170, height: 100)
                .cornerRadius(12)
            Text(name)
                .font(.system(size: 14, weight: .bold))
                .opacity(0.9)
                .foregroundColor(.primary)
        }
    }
}















// var db = Firestore.firestore()
// @State private var items = [TestItem]()

/*  List {
 ForEach(items) { item in
 Text("\(item.name)")
 }
 }.onAppear() {
 listenToFirestore()
 }
 
 Button(action: {
 saveToFireStore()
 }, label: {
 Text("Spara till firetore")
 })
 */


/*  func saveToFireStore() {
 let testItem = TestItem(name: "Morot")
 
 do {
 _ = try db.collection("testItem").addDocument(from: testItem)
 } catch {
 print("Error saving to db")
 }
 
 
 // db.collection("test").addDocument(data: ["name" : "Viktor"])
 }
 
 
 func listenToFirestore() {
 db.collection("testItem").addSnapshotListener {(snapshot, err) in
 if let err = err {
 print("Error getting doc \(err)")
 } else {
 items.removeAll()
 for document in snapshot!.documents {
 let result = Result {
 try document.data(as: TestItem.self)
 }
 switch result {
 case .success(let testItem):
 if let testItem = testItem {
 print("\(testItem)")
 items.append(testItem)
 } else {
 print("Document dosent exist")
 }
 case .failure(let error):
 print("Error decodning item: \(error)")
 }
 }
 }
 }
 
 db.collection("test").getDocuments() {(snapshot, err) in
 if let err = err {
 print("Error in \(err)")
 } else {
 for document in snapshot!.documents {
 print("\(document.documentID)  \(document.data())")
 }
 }
 }
 
 }
 */


