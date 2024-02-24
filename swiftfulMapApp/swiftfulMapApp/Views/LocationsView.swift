//
//  LocationsView.swift
//  swiftfulMapApp
//
//  Created by mustafa eray Pişkin on 19.02.2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        ZStack{
            mapLayer
                .ignoresSafeArea()
            VStack{
                header
                    .padding()
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}


extension LocationsView {
    
    
    private var header : some View {
        
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                }
            }
            
            if vm.showLocationsList{
                LocationsListView()
            }
            
        }
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer : some View{
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.6)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
            .ignoresSafeArea()
    }
    
    private var locationsPreviewStack : some View{
        ZStack{
            ForEach(vm.locations){location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.4), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion:
                                .move(edge: .leading),removal: .move(edge: .trailing)))
                        
                }
                
                
                
            }
        }
    }
    
}



