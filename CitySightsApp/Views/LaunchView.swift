//
//  ContentView.swift
//  CitySightsApp
//
//  Created by Sergei Kriukov on 30.05.2022.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    
    @EnvironmentObject var model:ContentModel
    
    
    var body: some View {
        if model.authorizationState == .notDetermined {
            
        } else if model.authorizationState == CLAuthorizationStatus.authorizedAlways || model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse {
            HomeView()
        } else {
            
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
