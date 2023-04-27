//
//  CatBreedView.swift
//  CatBreeds
//
//  Created by Dave Poirier on 2023-04-27.
//

import SwiftUI
import DomainLogic

struct CatBreedView: View {
    let breed: Breed
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Breed: \(breed.breed)")
            Text("Country: \(breed.country)")
            Text("Origin: \(breed.origin)")
            Text("Coat: \(breed.coat)")
            Text("Pattern: \(breed.pattern)")
        }
    }
}

struct CatBreedView_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedView(
            breed: Breed(
                breed: "Abyssinian",
                country: "Ethiopia",
                origin: "Natural/Standard",
                coat: "Short",
                pattern: "Ticked"))
    }
}
