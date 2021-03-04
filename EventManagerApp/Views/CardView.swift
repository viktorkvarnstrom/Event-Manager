//
//  CardView.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-22.
//

import SwiftUI

struct CardView: View {
    var event: Event
    var choice: String
    var location: String
    
    @ObservedObject var imageLoader:ImageLoader
    
    init(event: Event, choice: String, location: String) {
        imageLoader = ImageLoader(urlString: event.imageUrl)
        self.event = event
        self.choice = choice
        self.location = location
    }
    
    var body: some View {
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
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(event: Event(id: "", title: "Sverige - Danmark", location: "Stockholm", category: "fotboll", description: "", imageUrl: "fotboll", date: "2020-11-20", daysLeft: "85", exactLocation: "", isSaved: false, userId: ""), choice: "All", location: "Göteborg")
//    }
//}
