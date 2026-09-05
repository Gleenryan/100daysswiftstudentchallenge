//
//  Instafilter.swift
//  100swiftstudentchallenge
//
//  Created by Gleenryan on 05/09/26.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
import PhotosUI

struct ContentView2: View{
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItems: PhotosPickerItem?
    
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    
    var body: some View{
        NavigationStack{
            VStack{
                Spacer()
                
                
                PhotosPicker(selection: $selectedItems){
                    if let processedImage{
                        processedImage
                            .resizable()
                            .scaledToFit()
                    }else{
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("tap to import a photo"))
                    }
                    
                }
                //biar ga biru
                .buttonStyle(.plain)
                .onChange(of: selectedItems, loadImage)
                
                
                Spacer()
                
                HStack{
                    Text("Intensity")
                    Slider(value:$filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                
                HStack{
                    Button("Change Filter", action: changeFilter)
                    Spacer()
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
        }
    }
    
    func changeFilter(){
        
    }
    
    func loadImage(){
        Task{
            //why data, biar nanti bisa diedit atau dipakein filetr (gabisa pake type image)
            guard let imageData = try await selectedItems?.loadTransferable(type: Data.self) else {return}
            
            guard let inputImage = UIImage(data:imageData) else {return}
            
            let beginImage = CIImage(image: inputImage)
            
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing(){
        currentFilter.intensity = Float(filterIntensity)
        
        guard let outputImage = currentFilter.outputImage else {return}
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {return}
        
        let uiImage = UIImage(cgImage: cgImage)
        
        processedImage = Image(uiImage: uiImage)
        
    }
    
}

#Preview {
    ContentView2()
}
