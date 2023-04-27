//
//  ContentView.swift
//  CatBreeds
//
//  Created by Dave Poirier on 2023-04-27.
//

import SwiftUI
import DomainLogic

struct ContentView: View {
    
    @State var breeds: [Breed] = []

    var body: some View {
        VStack {
            Text("There are \(breeds.count) breeds listed")
            List(breeds) { breed in
                CatBreedView(breed: breed)
            }
        }
        .onAppear {
            Task {
                breeds = try await API.CatFacts.GetBreeds.withDefaults().query()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
