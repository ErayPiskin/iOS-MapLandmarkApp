//
//  LocationsListView.swift
//  swiftfulMapApp
//
//  Created by mustafa eray Pişkin on 19.02.2024.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .listRowBackground(Color.clear)
                
                    
            }
        }
        .background(.ultraThinMaterial)
        .listStyle(.plain)
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        
        HStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        
    }
    
    
}



