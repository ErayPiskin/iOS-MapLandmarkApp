//
//  LocationPreviewView.swift
//  swiftfulMapApp
//
//  Created by mustafa eray Pişkin on 20.02.2024.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    let location : Location
    
    var body: some View {
        HStack(alignment : .bottom ,spacing : 0){
            VStack(alignment : .leading ,spacing : 20) {
                imageSection
                titleSection
            }
            
            VStack(spacing : 10){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
        .clipped()
    }
    
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
        .padding()
        .environmentObject(LocationsViewModel())
}

extension LocationPreviewView {
    
    private var imageSection : some View {
        
        ZStack{
            if let imageNames = location.imageNames.first{
                Image(imageNames)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
        
    }
    
    private var titleSection : some View {
        
        VStack(alignment : .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        
    }
    
    private var learnMoreButton : some View {
        
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 100,height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton : some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 100, height: 30)
        }
        .buttonStyle(.bordered)
    }
}
