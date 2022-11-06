//
//  CountryView.swift
//  Countries
//
//  Created by Jakub Misiak on 09/10/2022.
//

import SwiftUI

struct CountryView: View {
    @State var country: Country
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack{
                Text(country.name.common).font(.title).foregroundColor(Color.gray).padding(10)
                AsyncImage(url: URL(string: country.flags.png)!){phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 200, maxHeight: 120)
                    case .failure:
                        Image(systemName: "photo")
                    };
                CountryAttributeView(label: "Full name", value: country.name.common)
                CountryAttributeView(label: "Native name:", value: country.name.official)
                CountryAttributeView(label: "Population", value: String(country.population))
                CountryAttributeView(label: "Region", value: country.region)
                CountryAttributeView(label: "Subregion", value: country.subregion)
                CountryAttributeView(label: "Area", value: country.area.description)
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline).fixedSize(horizontal: true, vertical: false)
        }
        
    }
}

    struct CountryView_Previews: PreviewProvider {
        static var previews: some View {
            CountryView(country: Country(name: Name(common: "Test", official: "Test"), capital: ["Test"],region: "Test",subregion: "Test",   area: 300.0, flag: "Test",population: 2000,  flags: CoatOfArms(png: "Test", svg: "test")))
        }}
}
