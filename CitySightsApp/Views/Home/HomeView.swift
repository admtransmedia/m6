//
//  HomeView.swift
//  CitySightsApp
//
//  Created by Sergei Kriukov on 31.05.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model:ContentModel
    @State var isMapShowing = false
    var body: some View {
        if model.restaurants.count != 0 || model.sights.count != 0 {
            NavigationView {
            if !isMapShowing {
                VStack(alignment: .leading){
                    HStack {
                        Image(systemName: "location")
                        Text("New-York")
                        Spacer()
                        Button {
                            self.isMapShowing = true
                        } label: {
                            Text("Switch to map view")
                        }

                    }
                    Divider()
                    BusinessList()
                    
                    
                }
                .padding([.horizontal, .top])
                .navigationBarHidden(true)
                
                
                
                
            } else {
                BusinessMap()
                    .ignoresSafeArea()
            }
            
        }
            
            
            
            
            
        } else {
        ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
