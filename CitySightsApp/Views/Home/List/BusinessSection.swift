//
//  BusinessSection.swift
//  CitySightsApp
//
//  Created by Sergei Kriukov on 31.05.2022.
//

import SwiftUI

struct BusinessSection: View {
    var title:String
    var businesses:[Business]
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: title)) {
            ForEach (businesses) { business in
                NavigationLink {
                    BusinessDetail(business: business)
                } label: {
                    BusinessRow(business: business)
                }

                
                
            }
        }
    }
}


