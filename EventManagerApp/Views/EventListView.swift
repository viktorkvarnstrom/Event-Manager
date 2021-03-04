//
//  EventListView.swift
//  EventManagerApp
//
//  Created by Viktor Kvarnström on 2021-02-02.
//

import SwiftUI

struct EventListView: View {
    @ObservedObject private var viewModel = EventsViewModel()
    var choice: String
    var location: String
    @State var isPresented = false
    @State private var searchTerm: String = ""
    @State var isSearching = false
    @State private var date = Date()

    
    
    var body: some View {
        VStack {
            HStack {
                TextField("Sök här.. ", text: $searchTerm)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color("back"))
            .cornerRadius(12)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if(isSearching) {
                        Button(action: {
                            searchTerm = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                        })
                    }
                }
                .padding(.horizontal, 32)
                .foregroundColor(.gray)
            )
            .padding(.top, 50)
            List {
                ForEach(viewModel.events.filter({ "\($0)".contains(searchTerm) || searchTerm.isEmpty})) { event in
                    if choice == event.category && location == event.location || choice == "All" || event.category == choice && location == "" {
                        VStack(alignment: .leading){
                            Button(action: {
                                self.isPresented.toggle()
                            }, label: {
                                CardView(event: event, choice: choice, location: location)
                            })
                        }.sheet(isPresented: $isPresented, content: {
                            EventView(event: event)
                        })
                    }
                }
            }.padding(.top, 25)
            .navigationBarTitle("Events", displayMode: .inline)
            .onAppear() {
                self.viewModel.fetchData()
            }
            
        }
    }
}

//struct EventListView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventListView(choice: "Musik", location: "Göteborg")
//    }
//}
