//
//  CountryAttributeView.swift
//  Countries
//
//  Created by Jakub Misiak on 09/10/2022.
//

import SwiftUI

struct CountryAttributeView: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(spacing: 12) {
                VStack(spacing: 4){
                    Text("\(label)").frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(value)").frame(maxWidth: .infinity, alignment: .leading)
                }.padding(.all)
            }.frame(width: 300, height: 70)
            .background(Color(.quaternarySystemFill))
            .cornerRadius(10)
    }
}

struct CountryAttributeView_Previews: PreviewProvider {
    static var previews: some View {
        CountryAttributeView(label: "Test", value: "Test")
    }
}
