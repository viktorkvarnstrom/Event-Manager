//
//  SavedListEventsView.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-03-03.
//

import SwiftUI
import FirebaseFirestore

struct SavedListEventsView: View {
    @ObservedObject private var viewModel = EventsViewModel()
    @State var isFavorite: Bool = false
    let event: Event
    
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
        }
    }
}
