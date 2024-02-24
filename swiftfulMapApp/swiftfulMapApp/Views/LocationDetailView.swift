//
//  LocationDetailView.swift
//  swiftfulMapApp
//
//  Created by mustafa eray Pişkin on 20.02.2024.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    let location : Location
    
    var body: some View {
        ScrollView {
            VStack{
                imageSection
                    .shadow(color: .black.opacity(0.4), radius: 20, y: 10)
                
                VStack(alignment: .leading, spacing: 15, content: {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                    
                })
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}



extension LocationDetailView {
    
    private var imageSection : some View {
        
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection : some View {
        
        VStack(alignment: .leading, spacing: 10, content: {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title2)
                .foregroundStyle(.secondary)
        })
    }
    
    private var descriptionSection : some View {
        
        VStack(alignment: .leading, spacing: 20, content: {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: location.link){
                Link("Read more on Wikipedia ", destination: url)
                    .font(.headline)
                    .foregroundStyle(.blue)
            }
        })
    }
    
    private var mapLayer : some View {
            
        Map(coordinateRegion : .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))),
            annotationItems: [location]) {location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
                
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(20)
    }
    private var backButton : some View{
        
        Button(action: {
            vm.sheetLocation = nil
        }, label: {
            Image(systemName: "xmark")
                .font(.title)
                .padding()
                .foregroundStyle(.black)
        })
    }
    
}
