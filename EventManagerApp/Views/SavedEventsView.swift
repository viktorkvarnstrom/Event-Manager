//
//  SavedEventsView.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-03.
//

import SwiftUI

struct SavedEventsView: View {
    @ObservedObject private var viewModel = EventsViewModel()
    @EnvironmentObject var isFav: EventsViewModel
    @State var isPresented = false
    var choice = "All"
    
    var body: some View {
        List(viewModel.events) { event in
            VStack(alignment: .leading){
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    CardView(event: event, choice: choice, location: "")
                })
            }.sheet(isPresented: $isPresented, content: {
                SavedListEventsView(event: event)
                Button(action: {
                    self.viewModel.deleteData(event: event)
                    self.isPresented.toggle()
                   // self.isFav.isFavorite.toggle()
                }, label: {
                    Text("Ta bort event")
                })
            })
        }
        .padding(.top, 25)
        .navigationBarTitle("Sparade event", displayMode: .inline)
        .onAppear() {
            self.viewModel.fetchFavorites()
        }
    }
}

// struct SavedEventsView_Previews: PreviewProvider {
//     static var previews: some View {
//      SavedEventsView()
//    }
//}
