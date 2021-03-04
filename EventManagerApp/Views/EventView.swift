//
//  EventView.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-03.
//

import SwiftUI
import FirebaseFirestore

struct EventView: View {
    @ObservedObject private var viewModel = EventsViewModel()
    @State var isFavorite: Bool = false
    let event: Event
    @EnvironmentObject var isFav: EventsViewModel
    
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(event: Event) {
        imageLoader = ImageLoader(urlString: event.imageUrl)
        self.event = event
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: imageLoader.image ?? UIImage() )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack {
                    VStack(alignment: .leading) {
                        Text(event.date)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(event.title)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(event.location.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(event.description)
                            .padding(.top, 25)
                    }
                    .layoutPriority(100)
                    
                    Spacer()
                }
                .padding()
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
            .padding([.top, .horizontal])
            VStack(alignment: .center) {
                Button(action: {
                    saveFavorite()
                }) {
                    HStack {
                        if event.isSaved || isFavorite == true {
                            Text("Eventet är sparat")
                        } else {
                            Text("Spara det här eventent")
                            Image(systemName: event.isSaved ? "star.fill" : "star")
                        }
                    }
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 350, height: 50)
                    .background(Color("pink"))
                    .foregroundColor(.primary)
                    .cornerRadius(10)
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 30)
            Spacer()
        }
    }
    
    func saveFavorite() {
        if isFavorite == false {
            self.viewModel.saveToFirestore(event: event)
            self.isFavorite.toggle()
        } else {
            self.viewModel.deleteData(event: event)
            self.isFavorite.toggle()
        }
    }
}

// struct EventView_Previews: PreviewProvider {
   // static var previews: some View {
      //  EventView(event: Event(id: "1", title: "Håkan Hellström", location: "Ullevi", category: "Musik", date: "08/08", daysLeft: "hej", // exactLocation: "hej"), savedEvents: SavedEventsViewModel)
  //  }
// }

