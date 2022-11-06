//
//  ContentView.swift
//  Countries
//
//  Created by Jakub Misiak on 09/10/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var countryAPI = CountryAPI()

    var body: some View {
        NavigationView{
            List{
                ForEach(countryAPI.countries) { country in
                    NavigationLink(destination: CountryView(country: country)) {
                            HStack{
                                Text(country.flag).font(.largeTitle)
                                VStack{
                                    Text(country.name.common)
                                    Text(country.region).font(.footnote).foregroundColor(.secondary)
                                }
                            }
                        }
                    }.listRowBackground(Color(.quaternarySystemFill))
            }.navigationTitle("Countries")
            .task {
                try? await countryAPI.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
