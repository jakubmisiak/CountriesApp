//
//  CountryAPI.swift
//  Countries
//
//  Created by Jakub Misiak on 23/10/2022.
//

import SwiftUI

@MainActor
class CountryAPI : ObservableObject {
    @Published var countries: [Country] = []

    func fetch() async throws{
        let url = URL(string: "https://restcountries.com/v3.1/region/europe")!
        let urlSession = URLSession.shared
        let (data, _ ) = try await urlSession.data(from: url)
        let decoder = JSONDecoder()
        self.countries = try decoder.decode([Country].self, from: data)
    }
}
